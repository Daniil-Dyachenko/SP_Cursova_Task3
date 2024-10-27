#!/bin/bash

# Directory 
target_directory="/home/daniil/SP/lab3"

# Directory check
if [ ! -d "$target_directory" ]; then
  echo "Цільова директорія не знайдена!"
  exit 1
fi

# Check directory files
for item in "$target_directory"/*; do
  if [ -d "$item" ]; then
    # If this directory
    echo "$(basename "$item") є директорією."
  elif [ -f "$item" ]; then
    # If this file
    filename=$(basename "$item")
    new_directory="${target_directory}/${filename}_dir"

    # Create new directory
    mkdir -p "$new_directory"

    # Move file in new directory
    mv "$item" "$new_directory/"
    echo "$filename переміщений."
  fi
done
