#!/bin/bash

datapath="data"

# New cars to csv
csvfile="$datapath/new_cars.csv"
for file in $datapath/new_pages/*
do
    while read -r line
    do
        echo "$line" | sed -n 's/^.*<h3><a class="" href="\([^"]*\)">\([^<]*\)<\/a><\/h3>/\2|\1/p' >> "$csvfile"
    done < "$file"
done

# Generate diffs

diff --new-line-format="" --unchanged-line-format="" "$datapath/new_cars.csv" "$datapath/old_cars.csv" > new_cars_only.csv
diff --new-line-format="" --unchanged-line-format="" "$datapath/old_cars.csv" "$datapath/new_cars.csv" > old_cars_only.csv
