#!/bin/bash

# Assign the string to a variable
my_string="
# Signed commits

![Coverage](https://img.shields.io/badge/coverage-22.3%25-green)


> **Warning**
> warning text

"

coverage=$(echo "$my_string" | grep -o 'coverage-[0-9]*\(\.[0-9]\{1,\}\)\?%' | sed 's/coverage-\(.*\)%/\1/')

# Print the extracted value
echo "Coverage: $coverage"
