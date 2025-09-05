#!/bin/sh
# Usage: ./add-dotfile.sh <folder> <filename>
# Example: ./add-dotfile.sh jj config.toml

set -e

FOLDER="$1"
FILE="$2"

if [ -z "$FOLDER" ] || [ -z "$FILE" ]; then
  echo "Usage: $0 <folder> <filename>"
  exit 1
fi

DOTFILES_DIR="$HOME/dotfiles/dotfiles"
CONFIG_DIR="$HOME/.config/$FOLDER"
TARGET_DIR="$DOTFILES_DIR/.config/$FOLDER"
TARGET_FILE="$TARGET_DIR/$FILE"
SOURCE_FILE="$CONFIG_DIR/$FILE"

mkdir -p "$TARGET_DIR"

# Move the file if it exists and not already a symlink
if [ -f "$SOURCE_FILE" ] && [ ! -L "$SOURCE_FILE" ]; then
  mv "$SOURCE_FILE" "$TARGET_FILE"
fi

# Ensure config folder exists
mkdir -p "$CONFIG_DIR"

# Remove old symlink if it exists
if [ -L "$SOURCE_FILE" ]; then
  rm "$SOURCE_FILE"
fi

ln -s "$TARGET_FILE" "$SOURCE_FILE"

echo "Moved $SOURCE_FILE to $TARGET_FILE and linked back."
