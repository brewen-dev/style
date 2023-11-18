## Build and move all files to dist/

# Cleanup dist/ if it exists
if [ -d dist ]; then
  rm -rf dist
  echo "Cleaned up dist/"
fi

# Compile index.scss to dist/index.css
bunx sass --style=expanded src/index.scss dist/index.css

if [ $? -ne 0 ]; then
  echo "Error: Failed to compile index.scss"
  exit 1
fi
echo "Built dist/index.css"

# Generate minified version of index.css
bunx sass --style=compressed src/index.scss dist/index.min.css

if [ $? -ne 0 ]; then
  echo "Error: Failed to compile index.min.scss"
  exit 1
fi
echo "Built dist/index.min.css"

# Move all other .scss files in src/ to dist/, except index.scss
find src -name "*.scss" ! -name "index.scss" -exec cp --parents {} dist \;
mv dist/src/* dist && rm -rf dist/src
echo "Moved all other .scss files in src/ to dist/"

# Move other files to dist/
cp package.json LICENSE CHANGELOG.md README.md dist
echo "Moved package.json, LICENSE and README.md to dist/"

echo "Done!"
