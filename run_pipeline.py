import subprocess
import os
import sys
import shutil

base_dir = os.path.abspath(os.path.dirname(__file__))

scraper_dir = os.path.join(base_dir, 'code', 'scraper')
nlp_dir = os.path.join(base_dir, 'code', 'nlp')
recommender_dir = os.path.join(base_dir, 'code', 'recommender')
scraper_env = os.path.join(base_dir, 'scraper_env')
sentiment_env = os.path.join(base_dir, 'sentiment_env')
recommender_env = os.path.join(base_dir, 'recommender_env')

# Helper function to create virtual environment if not exists
def create_virtualenv(env_path, requirements_file):
    # Remove the existing environment
    if os.path.exists(env_path):
        print(f"Removing existing virtual environment at {env_path}...")
        shutil.rmtree(env_path)
    print(f"Creating virtual environment at {env_path}...")
    subprocess.run([sys.executable, '-m', 'venv', '--copies', env_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    subprocess.run([os.path.join(env_path, 'bin', 'pip'), 'install', '--upgrade', 'pip', '-q'], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    subprocess.run([os.path.join(env_path, 'bin', 'pip'), 'install', '-r', requirements_file, '-q'], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    print(f"Virtual environment created and dependencies installed for {env_path}.")

# 1. Create the virtual environment for the scraper using '--copies'
print("Setting up scraper environment...")
create_virtualenv(scraper_env, os.path.join(scraper_dir, 'requirements.txt'))
# get rid of stale output
file_path = os.path.join(scraper_dir, 'output', 'scraped_reviews.jsonl')
if os.path.exists(file_path):
    print(f"Removing stale output at {file_path} ...")
    os.remove(file_path)

# 2. Run the scraper using the Python interpreter from the virtual environment
print("Starting the scraper...")
scrapy_cmd = [
    os.path.join(scraper_env, 'bin', 'python'),
    '-m', 'scrapy',
    'crawl', 'movie_reviews',
    '-o', os.path.join(base_dir,'code', 'scraper', 'output', 'scraped_reviews.jsonl')
]
subprocess.run(scrapy_cmd, cwd=scraper_dir)
print("Scraping done.")

# 3. Create the virtual environment for sentiment analysis
print("Setting up sentiment analysis environment...")
create_virtualenv(sentiment_env, os.path.join(nlp_dir, 'requirements.txt'))
# get rid of stale output
file_path = os.path.join(nlp_dir, 'output', 'reviews_with_bert_scores.jsonl')
if os.path.exists(file_path):
    print(f"Removing stale output at {file_path} ...")
    os.remove(file_path)

# 4. Run sentiment analysis using Python from the virtual environment
print("Starting sentiment analysis...")
subprocess.run([os.path.join(sentiment_env, 'bin', 'python'), 'sentimentAnalysis.py'], cwd=nlp_dir)
print("Sentiment analysis done.")

# 5. Create the virtual environment for the recommender system
print("Setting up recommender system environment...")
create_virtualenv(recommender_env, os.path.join(recommender_dir, 'requirements.txt'))

# 6. Run recommender system using Python from the virtual environment
print("Starting recommender system...")
subprocess.run([os.path.join(recommender_env, 'bin', 'python'), 'recommender.py'], cwd=recommender_dir)
print("Recommender system done.")
