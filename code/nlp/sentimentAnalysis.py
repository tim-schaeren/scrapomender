from transformers import pipeline
import json
import os
import torch

# Check if Metal (MPS) is available and set the device accordingly
if torch.backends.mps.is_available():
    device = 0  # GPU (MPS) is available
else:
    device = -1  # Fallback to CPU

# Load a pre-trained BERT-based sentiment analysis model
sentiment_pipeline = pipeline("sentiment-analysis", device=device)

# Function to assign a score using BERT model sentiment analysis
def assign_bert_sentiment_score(review_text):
    result = sentiment_pipeline(review_text)[0]
    sentiment = result['label']  # 'POSITIVE' or 'NEGATIVE'
    confidence = result['score']  # Confidence score (probability)
    
    # Map the confidence score to a 0-10 scale (adjust if needed)
    if sentiment == 'POSITIVE':
        return round(confidence * 10, 1)
    else:
        return round((1 - confidence) * 10, 1)

# Process reviews from the input file
# Get the absolute path of the current script
base_dir = os.path.abspath(os.path.dirname(__file__))
input_file_path = os.path.join('..', 'scraper', 'output', 'scraped_reviews.jsonl')
output_file_path = os.path.join(base_dir, 'output', 'reviews_with_bert_scores.jsonl')

output_lines_bert = []
with open(input_file_path, 'r', encoding='utf-8') as file:
    for line in file:
        review = json.loads(line.strip())
        review_text = review.get('review_text', '')
        review['score'] = str(assign_bert_sentiment_score(review_text))  # Add BERT-based score
        # Set ensure_ascii=False to preserve non-ASCII characters
        output_lines_bert.append(json.dumps(review, ensure_ascii=False))

# Save the processed reviews with BERT-based scores
with open(output_file_path, 'w', encoding='utf-8') as output_file:
    for line in output_lines_bert:
        output_file.write(line + '\n')

print("Sentiment analysis complete! Check the file:", output_file_path)
