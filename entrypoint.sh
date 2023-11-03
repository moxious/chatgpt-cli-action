#!/bin/bash

echo "Hello $1 / $2"
output=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
