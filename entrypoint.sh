#!/bin/bash
TYPE=$1
URL=$2
PROMPT=$3

echo "Hello $1 / $2"

# gh issue view https://whatever
gh "$2" view "$1" | tee github-context.txt

echo $PROMPT > context.txt

cat github-context.txt | chatgpt-cli --context context.txt | tee outputs.txt
echo output=\"`cat outputs.txt`\" >> $GITHUB_OUTPUT
