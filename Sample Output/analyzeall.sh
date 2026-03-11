#!/bin/bash

# Validate input
if [ -z "$1" ]; then
    echo "You must provide a configuration (e.g., sv0-ps512)"
    exit 1
fi

mkdir -p analyzedData/$1
mkdir -p summarizedData

if [ ! -d "flowData/$1" ]; then
    echo "Invalid configuration: flowData/$1 does not exist"
    exit 1
fi

# Analyze each node's result
for n in {2..30}; do
    echo "Analyzing $n nodes..."
    python3 analyze.py flowData/$1/final-${n}-nodes.xml $1 > analyzedData/$1/${n}-nodes.txt
done

echo "✅ Analysis complete. Results stored in analyzedData/$1."
