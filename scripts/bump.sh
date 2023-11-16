## Bump package version in package.json

# Read current version from package.json
PKG_VERSION=$(cat package.json | jq -r '.version')

# Increment version
PKG_VERSION=$(echo $PKG_VERSION | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')

# Update package.json
jq --arg v "$PKG_VERSION" '.version = $v' package.json > tmp.$$.json && mv tmp.$$.json package.json

export PKG_VERSION
