#!/bin/bash

BASE_DIR="/Volumes/Work/laravel-core-source"
DEST_DIR="/Volumes/Work/laravel-core"

# Define source and destination directories
SOURCE_DIR="$BASE_DIR/src/Providers"
OUTPUT_DIR="$DEST_DIR/src/Providers"

# remove all files from $DEST_DIR except .git and .github
find $DEST_DIR -mindepth 1 -maxdepth 1 ! -name '.git' ! -name '.github' -exec rm -rf {} +

# Copy all files from $SOURCE_DIR to $DEST_DIR
rsync -av --exclude=".git/" --exclude="comments.txt"  --exclude="vendor/" --exclude="src/Providers/" --exclude="encode.sh" "$BASE_DIR/" "$DEST_DIR/"

# Run the Python obfuscator script
python3 /Volumes/Work/php-obfuscator/main.py <<EOF
3
$OUTPUT_DIR


n
n
n
$SOURCE_DIR
EOF

# Create the destination directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Remove 'obfuscated_' prefix from all filenames in the destination directory
for file in "$OUTPUT_DIR"/obfuscated_*; do
    if [ -e "$file" ]; then
        mv "$file" "${file/obfuscated_/}"
    fi
done

echo "Build completed: Files obfuscated, copied, and renamed."