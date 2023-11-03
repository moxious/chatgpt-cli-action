#!/bin/bash

echo "Hello $1 / $2"
output=$(date)
echo "time=$output" >> $GITHUB_OUTPUT
