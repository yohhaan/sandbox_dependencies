#!/bin/bash
output_folder=utils
mkdir -p $output_folder

# GCIDE
gcide_path=$output_folder/gcide-latest.tar.gz
if [ ! -f $gcide_path ]
then
    wget -q -O $gcide_path https://ftp.gnu.org/gnu/gcide/gcide-latest.tar.gz
    mkdir -p $output_folder/gcide-latest
    tar -xf $gcide_path -C $output_folder/gcide-latest --strip-components=1
fi

# Wordnet
output_wordnet=$output_folder/wordnet
output_wordnet_words=$output_wordnet/wordnet.words
mkdir -p $output_wordnet
if [ ! -f $output_wordnet_words ]
then
    python3 wordnet_download.py $output_wordnet
    python3 wordnet_extract_all_words.py $output_wordnet > $output_wordnet_words
fi

# Word2Vec
word2vec_drive_id=0B7XkCwpI5KDYNlNUTTlSS21pQmM #https://drive.google.com/file/d/0B7XkCwpI5KDYNlNUTTlSS21pQmM/edit?usp=sharing
output_word2vec_folder=$output_folder/word2vec
mkdir -p $output_word2vec_folder
if [ ! -f $output_word2vec ]
then
    cd $output_word2vec_folder
    gdown $word2vec_drive_id
fi

# Public suffix list
psl_path=$output_folder/public_suffix_list.dat
if [ ! -f $psl_path ]
then
    wget -q -O $psl_path https://publicsuffix.org/list/public_suffix_list.dat
fi