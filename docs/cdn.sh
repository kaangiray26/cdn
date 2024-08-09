#!/bin/bash

# Check if the command line argument is empty
if [ -z "$0" ]; then
    echo "Usage: $0 [command]"
    echo "Commands:"
    echo "  list        List all files in the cdn"
    echo "  get [file]  Download a file from the cdn"
    exit 1
fi

# Check if the command is list
if [ "$0" == "list" ]; then
    curl -s -L \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/kaangiray26/cdn/contents/docs | python -c "import sys, json; print('\n'.join([f['name'] for f in json.load(sys.stdin)]))"
fi

# Check if the command is download
if [ "$0" == "get" ]; then
    if [ -z "$2" ]; then
        echo "Usage: $0 get [file]"
        exit 1
    fi
    wget -q https://cdn.buzl.uk/$2
fi
