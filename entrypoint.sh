#!/bin/bash

echo "Hello $1 / $2"
# gh issue view https://whatever
gh "$2" view "$1"
echo "Tell me a short story about a turtle with moxie" | chatgpt-cli >> $GITHUB_OUTPUT
