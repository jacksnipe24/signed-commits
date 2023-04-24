FILE_TO_COMMIT="README.md"
NEW_COVERAGE=18
awk '{gsub(/!\[Coverage\]\(https:\/\/img\.shields\.io\/badge\/coverage-[0-9]{1,3}%25-green\)/,"![Coverage](https://img.shields.io/badge/coverage-'$NEW_COVERAGE'%25-green)")}1' "$FILE_TO_COMMIT" >tmp && mv tmp "$FILE_TO_COMMIT"
