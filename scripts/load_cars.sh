#!/bin/bash

datapath="data"

# Set the URL to scrape
url=$1 

# Use curl to fetch the HTML from the URL
landing_page=$(curl -s "$url")

# Use grep to filter out h3 headers, remove #sid so the links match
echo -n "loading page 1... "
echo "$landing_page" | grep '<h3><a class="" href=".*</h3>' -o | sed 's/\(#sid=[^"]*\)//g' > "$datapath/new_pages/page1.html"
echo "done"

# Get pagination
max_page=$(echo "$landing_page" | grep '<li class="last">.*</li>' -o | grep -o -P "(?<=page)[0-9]+(?=\")" | head -1)

if (( max_page > 1 )); then
    for ((i=2; i<=$max_page; i++)); do
        page="page$i"
        paginated_url="$url/$page"
        echo -n "loading page ${i}... "
        page_html=$(curl -s "$paginated_url") 
        echo "done"
        echo "$page_html" | grep '<h3><a class="" href=".*</h3>' -o | sed 's/\(#sid=[^"]*\)//g' > "$datapath/new_pages/${page}.html"
    done
fi
