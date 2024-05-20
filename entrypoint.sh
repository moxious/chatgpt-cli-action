#!/bin/bash
TYPE=$1
URL=$2
PROMPT=$3

echo "Hello $1 / $2"

# gh issue view https://whatever
gh "$TYPE" view "$URL" | tee github-context.txt

echo $PROMPT > context.txt

echo "Running client to see what the robot thinks...."

# The model in use here is important, as it is the only model as of this writing that has
# JSON output capabilities
cat github-context.txt | chatgpt-cli -m gpt-4 --json -n --context context.txt 2>$HOME/errors.txt | tee $HOME/outputs.txt
echo output=`cat $HOME/outputs.txt` >> $GITHUB_OUTPUT
echo errors=`cat $HOME/errors.txt` >> $GITHUB_OUTPUT
