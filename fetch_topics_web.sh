#!/bin/bash
output_folder="topics_web"
mkdir -p $output_folder

#Manual Dependency - Model
model_path=$output_folder/model.tflite
vocab_path=$output_folder/vocab.txt
model_path_temp=$output_folder/model.zip
if [ ! -f $vocab_path ]
then
    cp $model_path $model_path_temp
    unzip -d $output_folder $model_path_temp
    rm $model_path_temp
fi

#Fetching page_topics_override_list.proto
proto_path=$output_folder/page_topics_override_list.proto
if [ ! -f $proto_path ]
then
    wget -q -O $proto_path https://raw.githubusercontent.com/chromium/chromium/main/components/optimization_guide/proto/page_topics_override_list.proto
    protoc $proto_path --python_out=.
fi

#Manual Dependency - Override List Extraction
override_list_path=$output_folder/override_list.pb
override_list_csv_path=$output_folder/override_list.csv
if [ ! -f $override_list_csv_path ]
then
    gzip -cdk $override_list_path.gz > $override_list_path
    python3 override_list_to_csv.py $override_list_path > $override_list_csv_path
fi

#Fetching Taxonomy
taxo_path=$output_folder/taxonomy
taxo_path_md=$taxo_path.md
taxo_path_pickle=$taxo_path.pickle
if [ ! -f $taxo_path_pickle ]
then
    wget -q -O $taxo_path_md https://raw.githubusercontent.com/patcg-individual-drafts/topics/main/taxonomy_v1.md
    python3 parse_taxonomy_md.py $taxo_path_md $taxo_path_pickle #eventually switch to csv and import with pandas
fi

# Latest CrUX top list
crux_path=$output_folder/crux.csv.gz
crux_csv_path=$output_folder/crux.csv
if [ ! -f $crux_csv_path ]
then
    wget -q -O $crux_path https://raw.githubusercontent.com/zakird/crux-top-lists/main/data/global/current.csv.gz
    gzip -cdk $crux_path > $crux_csv_path
    rm $crux_path
fi

# Latest Tranco top list
tranco_1m_path=$output_folder/top-1m.csv
tranco_1m_path_zip=$tranco_1m_path.zip
tranco_id_path=$output_folder/top-1m.id
if [ ! -f $tranco_1m_path ]
then
    wget -q -O $tranco_1m_path_zip https://tranco-list.eu/top-1m.csv.zip
    wget -q -O $tranco_id_path https://tranco-list.eu/top-1m-id
    unzip -d $output_folder $tranco_1m_path_zip
    rm $tranco_1m_path_zip
fi