set +e
files=$(find ./test -name "*.test.ts" | xargs grep -l 'test.only')
set -e

if [[ -n $files ]]; then
  echo "Error: Found /test.only/ in one of the following test files:"
  echo "$files"
  exit 1
else
  echo "No instances of /test.only/ found in test files"
fi
