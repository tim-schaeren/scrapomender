**this is a repo pertaining to my master thesis project on web-scraping based recommender systems.**

in this first POC, i use [scrapy](https://docs.scrapy.org/en/latest/index.html) to crawl and scrape [rottentomatoes.com](https://www.rottentomatoes.com) for movies and their reviews. In a next step i use [torch](https://pypi.org/project/torch/) and [transformers](https://pypi.org/project/transformers/) to assign sentiment scores to those reviews. These results should later be fed into a recommender system (working on that).


 *1. start scraping:*

	cd scrapomender/code/scraper
	pip install -r requirements.txt
	scrapy crawl movie_reviews -o ./output/scraped_reviews.jsonl

 *2. start sentiment analysis:*

	cd scrapomender/code/nlp
	pip install -r requirements.txt
	python sentimentAnalysis.py
