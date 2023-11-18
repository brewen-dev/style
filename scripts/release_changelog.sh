## Parse changelog for the latest release in the CHANGELOG.md file

VERSION=$(cat package.json | jq -r '.version')

# Get the line number of the latest release
LINE_NUM=$(grep -n "## $VERSION" CHANGELOG.md | cut -d: -f1)
LINE_AFTER=$(($LINE_NUM + 1))

# Get the line number of the next release (always a line __after__ LINE_NUM)
NEXT_LINE_NUM_AFTER=$(tail -n +$LINE_AFTER CHANGELOG.md | grep -n "^## " | cut -d: -f1 | head -n 1)

if [ -z "$NEXT_LINE_NUM_AFTER" ]; then
  # If there is no next release, then the changelog ends at the end of the file
  NEXT_LINE_NUM=$(wc -l CHANGELOG.md | awk '{print $1}')
else
  # If there is a next release, then the changelog ends at the line before the next release
  NEXT_LINE_NUM=$(($LINE_AFTER + $NEXT_LINE_NUM_AFTER - 2))
fi

# Get the changelog for the latest release
CHANGELOG=$(sed -n "$LINE_NUM,$NEXT_LINE_NUM p" CHANGELOG.md)

echo $CHANGELOG
