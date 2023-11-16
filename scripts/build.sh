## Build and move all files to dist/

SASS_PATH=$(which sass)
if [ -z "$SASS_PATH" ]; then
  # Try to resolve sass path in node_modules
  SASS_PATH=$(find node_modules/.bin -name sass -type f)
fi

# Cleanup dist/ if it exists
if [ -d dist ]; then
  rm -rf dist
  echo "Cleaned up dist/"
fi

# Compile index.scss to dist/index.css
$SASS_PATH --style=expanded src/index.scss dist/index.css
echo "Built dist/index.css"
# Generate minified version of index.css
$SASS_PATH --style=compressed src/index.scss dist/index.min.css
echo "Built dist/index.min.css"

# Move all other .scss files in src/ to dist/, except index.scss
find src -name "*.scss" ! -name "index.scss" -exec cp --parents {} dist \;
mv dist/src/* dist && rm -rf dist/src
echo "Moved all other .scss files in src/ to dist/"

# Move other files to dist/
cp package.json LICENSE README.md dist
echo "Moved package.json, LICENSE and README.md to dist/"

echo "Done!"
