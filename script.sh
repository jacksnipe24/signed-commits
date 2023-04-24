coverage=98
readme="README.md"

awk '{gsub(/!\[Coverage\]\(https:\/\/img\.shields\.io\/badge\/coverage-[0-9]{1,3}%25-green\)/,"![Coverage](https://img.shields.io/badge/coverage-'$coverage'%25-green)")}1' "$readme" > tmp && mv tmp "$readme"


