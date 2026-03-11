#!/bin/bash

# Validate input
if [ -z "$1" ]; then
    echo "You must provide a configuration (e.g., sv0-ps512)"
    exit 1
fi

if [ ! -d "analyzedData/$1" ]; then
    echo "Invalid configuration: analyzedData/$1 does not exist"
    exit 1
fi

# Summarize important metrics
for n in {2..30}; do
    echo -n "$n nodes: "
    grep -F "Lost" < analyzedData/$1/${n}-nodes.txt
done

echo "✅ Summarization done."
