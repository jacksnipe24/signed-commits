readme="README.md"

yarn test

new_coverage=$(jq '.[].s | map(select(. > 0)) | length * 100 / length' coverage/coverage-final.json)

awk '{gsub(/!\[Coverage\]\(https:\/\/img\.shields\.io\/badge\/coverage-[0-9]{1,3}%25-green\)/,"![Coverage](https://img.shields.io/badge/coverage-'$new_coverage'%25-green)")}1' "$readme" > tmp && mv tmp "$readme"


