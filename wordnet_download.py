import nltk
import sys

if len(sys.argv) != 2:
    print(
        "Not the correct number of arguments passed: python3 download_wordnet.py output_path"
    )
    exit - 1

nltk.download("wordnet", download_dir=sys.argv[1])
