import nltk
import sys
from nltk.corpus import wordnet as wn

nltk.data.path.append(sys.argv[1])

for w in wn.all_lemma_names():
    print(w)
