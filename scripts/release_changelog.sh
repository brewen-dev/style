## Parse changelog for the latest release in the CHANGELOG.md file

VERSION=$(cat package.json | jq -r '.version')

VERSION_PATTERN="^### \?\[[0-9]\+\.[0-9]\+\.[0-9]\+\]"
CURRENT_VERSION_PATTERN="^### \?\[$VERSION\?\]"

# Get the line number of the latest release
LINE_NUM=$(grep -n "$CURRENT_VERSION_PATTERN" CHANGELOG.md | cut -d: -f1)
LINE_AFTER=$(($LINE_NUM + 1))

echo "Found version $VERSION at line $LINE_NUM"

# Get the line number of the next release (always a line __after__ LINE_NUM)
NEXT_LINE_NUM_AFTER=$(tail -n +$LINE_AFTER CHANGELOG.md | grep -n "$VERSION_PATTERN" | cut -d: -f1 | head -n 1)

if [ -z "$NEXT_LINE_NUM_AFTER" ]; then
  echo "No next release found, changelog ends at the end of the file"
  # If there is no next release, then the changelog ends at the end of the file
  NEXT_LINE_NUM=$(wc -l CHANGELOG.md | awk '{print $1}')
else
  echo "Next release found at line $NEXT_LINE_NUM_AFTER"
  # If there is a next release, then the changelog ends at the line before the next release
  NEXT_LINE_NUM=$(($LINE_AFTER + $NEXT_LINE_NUM_AFTER - 2))
fi

# Write to RELEASE.md, from LINE_NUM to NEXT_LINE_NUM
sed -n "$LINE_NUM,${NEXT_LINE_NUM}p" CHANGELOG.md > RELEASE.md
echo "Wrote release notes to RELEASE.md"
