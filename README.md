**this is a repo pertaining to my master thesis project on web-scraping based recommender systems.**

in this first POC, i use [scrapy](https://docs.scrapy.org/en/latest/index.html) to crawl and scrape [rottentomatoes.com](https://www.rottentomatoes.com) for movies and their reviews. In a next step i use [torch](https://pypi.org/project/torch/) and [transformers](https://pypi.org/project/transformers/) to assign sentiment scores to those reviews. These results are then fed into a recommender system ([surprise](https://pypi.org/project/scikit-surprise/)) where an [SVD algorithm](https://medium.com/@ritik_gupta/how-singular-value-decomposition-svd-is-used-in-recommendation-systems-clearly-explained-201b24e175db) tries to predict how a reviewer might rate a given movie.

simply run this to try it out:

    cd scrapomender
    python run_pipeline.py
