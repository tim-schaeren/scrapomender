import logging
import time
from scrapy.spiders import Spider
from scrapy.http import Request

class RTReviewsSpider(Spider):
    name = "movie_reviews"
    allowed_domains = ["rottentomatoes.com"]

    def start_requests(self):
        url = 'https://www.rottentomatoes.com/browse/movies_in_theaters/sort:top_box_office'
        logging.warning(f"Now scraping website: {url}")  # Custom log message
        yield Request(url=url, callback=self.parse_movies, meta={'selenium': True})

    def parse_movies(self, response):
        movie_urls = response.css("a[data-qa='discovery-media-list-item-caption']::attr(href)").getall()
        logging.warning(f"Found {len(movie_urls)} movies.")  # Custom log message
        
        for url in movie_urls:
            movie_url = response.urljoin(url + '/reviews')
            movie_title = url.split("/")[-1]  # Extract movie name from URL
            logging.warning(f"Now scraping movie reviews from {movie_url}")  # Custom log message
            yield Request(url=movie_url, callback=self.parse_reviews, meta={'selenium': True, 'movie_title': movie_title})

    def parse_reviews(self, response):
        reviews = response.css("div.review-row")
        movie_title = response.meta['movie_title']
        logging.warning(f"Found {len(reviews)} reviews for movie {movie_title}.")

        for review in reviews:
            author = review.css("a.display-name::text").get().strip()
            review_text = review.css("p.review-text::text").get().strip()
            yield {
                'movie': movie_title,
                'author': author,
                'review_text': review_text,
            }

        # Trigger Selenium to handle "Load More" button if necessary using meta
        load_more_button = response.css('rt-button[data-qa="load-more-btn"]')
        if load_more_button:
            logging.warning(f"Clicking 'See More' button for {movie_title}")
            # Use Selenium via middleware by sending a new request with meta
            yield Request(response.url, callback=self.parse_reviews, meta={'selenium': True, 'movie_title': movie_title})


    def click_load_more(self, response):
        load_more_button = response.css('rt-button[data-qa="load-more-btn"]')
        if load_more_button:
            load_more_button = load_more_button[0]
            self.driver.execute_script("arguments[0].click();", load_more_button)
            time.sleep(3)  # Adjust sleep as needed
            new_body = self.driver.page_source
            return HtmlResponse(url=response.url, body=new_body, encoding='utf-8', request=response.request)
