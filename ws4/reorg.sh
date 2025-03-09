#!/bin/bash

datetime=$(date "+%F-%T")

vendor_ids=("1.0" "2.0" "4.0")

input_file="2019-01-h1.csv"

> .gitignore

for vendor in "${vendor_ids[@]}"; do
        output_file="${datetime}-${vendor}.csv"

        grep "^$vendor," "$input_file" > "$output_file"

        echo "$output_file" >> .gitignore

done

> ws4.txt
for vendor in "${vendor_ids[@]}"; do
        output_file="${datetime}-${vendor}.csv"
        wc "$output_file" >> ws4.txt
done

echo "" >> ws4.txt
echo ".gitignore files: " >> ws4.txt
cat .gitignore >> ws4.txt
echo "2019-01-h1.csv" >> .gitignore
cat ws4.txt
