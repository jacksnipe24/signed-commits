COVERAGE_STATEMENTS=$(cat coverage/coverage-summary.json | jq '.total.statements.pct | round')
BRANCH="coverage-pr-$COVERAGE_STATEMENTS"

echo $BRANCH