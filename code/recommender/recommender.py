import json
import os
import random
import pandas as pd
from surprise import Dataset, Reader
from surprise import SVD
from surprise.model_selection import train_test_split
from surprise import accuracy
from surprise.model_selection import cross_validate

# Load the data from the JSONL file
base_dir = os.path.abspath(os.path.dirname(__file__))
input_file_path = os.path.join('..', 'nlp', 'output', 'reviews_with_bert_scores.jsonl')
data = []
with open(input_file_path, 'r') as f:
    for line in f:
        review = json.loads(line)
        user_id = review['author']
        movie_id = review['movie']
        rating = float(review['score'])
        data.append((user_id, movie_id, rating))

# Define a reader to parse the data
reader = Reader(rating_scale=(0, 10))

# Load data into a pandas DataFrame first for inspection
df = pd.DataFrame(data, columns=['user_id', 'movie_id', 'rating'])

# Load data into surprise's Dataset
dataset = Dataset.load_from_df(df, reader)

# Use SVD algorithm
algo = SVD()

# Split the data into training and testing sets
trainset, testset = train_test_split(dataset, test_size=0.25)

# Train the model
algo.fit(trainset)

# Test the model
predictions = algo.test(testset)

# Check accuracy
accuracy.rmse(predictions)

# Get a list of users and movies from the dataset
users = df['user_id'].unique()
movies = df['movie_id'].unique()

# Randomly select a user and a movie
random_user = random.choice(users)
random_movie = random.choice(movies)

# Predict a rating for the randomly selected user and movie
try:
    predicted_rating = algo.predict(random_user, random_movie).est
    print(f'Predicted rating for {random_user} on {random_movie}: {predicted_rating:.2f}')
except Exception as e:
    print(f"Error in prediction: {e}")

# Cross validate the model
cross_validate(algo, dataset, measures=['RMSE', 'MAE'], cv=2, verbose=True)
