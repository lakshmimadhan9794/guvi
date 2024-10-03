#!/bin/bash

status_code=$(curl -o /dev/null -s -w "%{http_code}" https://www.guvi.in)
echo "HTTP Status Code: $status_code"

if [ $status_code -eq 200 ]; then
  echo "Success: guvi.in is reachable."
else
  echo "Failure: Error occurred with status code $status_code."
fi

file=$1  # Take the file name as an argument
if [ -z "$file" ]; then
  echo "Please provide a file name as an argument."
  exit 1
fi

sed -i '5,$ { /welcome/ s/give/learning/g }' "$file"
echo "Replacement done in file: $file"

