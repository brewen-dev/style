## Check git commits from the last tag to HEAD to match for fix, feat, perf or BREAKING CHANGE
## If any of these is found, a new release is needed

# Get the last tag
LAST_TAG=$(git describe --tags --abbrev=0)

# Get the commits from the last tag to HEAD
COMMITS=$(git log --pretty=format:"%s" $LAST_TAG..HEAD)

PREFIX_MATCH="^(fix|feat|perf)\?(\(.+\)):"

# Check if any of the commits match the prefix
FOUND=$(echo "$COMMITS" | grep -E "$PREFIX_MATCH")

if [ -z "$FOUND" ]; then
  FOUND=$(echo "$COMMITS" | grep -E "BREAKING CHANGE")
fi

echo $(test -n "$FOUND" && echo "true" || echo "false")
