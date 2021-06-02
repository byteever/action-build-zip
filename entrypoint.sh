#!/bin/sh

set -eo

# Set variables
BUILD_PATH="./build"

# If not configured defaults to repository name
if [ -z "$FILENAME" ]; then
  FILENAME=${GITHUB_REPOSITORY#*/}
fi
echo "ℹ︎ FILENAME is $FILENAME"

# Set GitHub "path" output
DEST_PATH="$BUILD_PATH/$FILENAME"
echo "::set-output name=path::$DEST_PATH"

cd "$GITHUB_WORKSPACE" || exit

echo "➤ Generating build directory..."
rm -rf "$BUILD_PATH"
mkdir -p "$DEST_PATH"

echo "➤ Copying files..."
if [ -r "${GITHUB_WORKSPACE}/.distignore" ]; then
  rsync -rc --exclude-from="$GITHUB_WORKSPACE/.distignore" "$GITHUB_WORKSPACE/" "$DEST_PATH/" --delete --delete-excluded
else
  rsync -rc "$GITHUB_WORKSPACE/" "$DEST_PATH/" --delete
fi

if [ -r "${DEST_PATH}/build" ]; then
  rm -rf "${DEST_PATH}/build"
fi

echo "➤ Generating zip file..."
cd "$BUILD_PATH" || exit
zip -r "${FILENAME}.zip" "$FILENAME/"
# Set GitHub "zip_path" output
echo "::set-output name=zip_path::$BUILD_PATH/${FILENAME}.zip"
echo "✓ Zip file generated!"