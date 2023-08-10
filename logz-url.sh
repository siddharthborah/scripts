#!/bin/bash

# Function to modify the URL
modify_url() {
    local uuid=$1
    local time_range=$2
    local url="https://app-wa.logz.io/#/dashboard/osd/discover/?_a=(columns:!(msg),filters:!((meta:(alias:!n,disabled:!f,index:'logzioCustomerIndex*',key:taskchain_id,negate:!f,params:(query:'$uuid'),type:phrase),query:(match_phrase:(taskchain_id:'$uuid')))),index:'logzioCustomerIndex*')&_g=(time:(from:now-$time_range,to:now))"
    echo "$url"
}

# Check if the first argument (new UUID) and second argument (time range) are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: ./replace-url.sh <new_uuid> <time_range> [open]"
    exit 1
fi

# Get the new UUID and time range from the first and second arguments
new_uuid="$1"
time_range="$2"

# Modify the URL with the new UUID and time range
modified_url=$(modify_url "$new_uuid" "$time_range")

# Check if the third argument (open) is provided and equals "open"
if [ "$3" = "open" ]; then
    # Try to open the URL in the default web browser
    if command -v xdg-open &>/dev/null; then
        xdg-open "$modified_url"  # On Linux
    elif command -v open &>/dev/null; then
        open "$modified_url"      # On macOS
    else
        echo "Cannot open URL. Please use 'xdg-open' or 'open' command."
    fi
else
    echo "$modified_url"
fi
