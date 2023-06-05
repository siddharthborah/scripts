#!/bin/bash

# Generate a random folder name based on the current time
date_str=$(date +%Y%m%d)
hash_str=$(echo $date_str | openssl sha1 | cut -c1-8)
# clean_str=$(echo $date_str | tr -cd '[:alnum:]')

folder_name=$date_str-$hash_str

# Create the folder with the generated name
mkdir "$folder_name"

echo "Created folder $folder_name"