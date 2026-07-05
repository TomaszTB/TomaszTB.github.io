#!/bin/bash
SOURCE_DIR="images/photography"
THUMB_DIR="images/photography/thumbs"

mkdir -p "$THUMB_DIR"

# Using ImageMagick's 1080x1080> which limits the larger dimension to 1080px
# while preserving the aspect ratio.
for img in "$SOURCE_DIR"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
    [ -f "$img" ] || continue
    
    filename=$(basename "$img")
    
    if [ ! -f "$THUMB_DIR/$filename" ] || [ "$img" -nt "$THUMB_DIR/$filename" ]; then
        echo "Generating thumbnail for $filename..."
        magick "$img" -resize 1080x1080\> -quality 85 "$THUMB_DIR/$filename"
    fi
done
echo "Done!"
