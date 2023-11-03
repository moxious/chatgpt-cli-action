#!/bin/bash

echo "Hello $1 / $2"
output=$(date)
echo "output=$output" >> $GITHUB_OUTPUT
