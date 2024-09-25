this is a repo pertaining to a master thesis project on "web-scraping based recommender systems"


start scraping:
cd scrapomender/code/scraper
pip install -r requirements.txt
scrapy crawl movie_reviews -o ./output/scraped_reviews.jsonl

start sentiment analysis:
cd scrapomender/code/nlp
pip install -r requirements.txt
python sentimentAnalysis.py


