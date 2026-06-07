#!/bin/bash

# Dynamically detect the exact directory where this script is living
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Starting dotfiles setup from: $DOTFILES_DIR"

# ---------------------------------------------------------
# 1. Symlink .zshrc
# ---------------------------------------------------------
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
    echo "📦 Backed up existing .zshrc"
fi

rm -f ~/.zshrc
ln -s "$DOTFILES_DIR/.zshrc" ~/.zshrc
echo "✅ Symlinked .zshrc!"

# ---------------------------------------------------------
# 2. Setup the config directories (kitty, nvim)
# ---------------------------------------------------------
mkdir -p ~/.config
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

for dir in nvim kitty; do
    SOURCE_DIR="$DOTFILES_DIR/$dir"
    TARGET_DIR="$HOME/.config/$dir"

    # Check if the source directory actually exists in the cloned repo
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "⚠️ Warning: Source $SOURCE_DIR not found. Skipping $dir."
        continue
    fi

    # If the target is a real directory (not a symlink), back it up
    if [ -d "$TARGET_DIR" ] && [ ! -L "$TARGET_DIR" ]; then
        BACKUP_DIR="${TARGET_DIR}.backup_${TIMESTAMP}"
        echo "📦 Backing up existing $dir config to $BACKUP_DIR"
        mv "$TARGET_DIR" "$BACKUP_DIR"
    fi

    # Remove the target if it already exists (e.g., an old symlink)
    rm -rf "$TARGET_DIR"

    # Create the new symlink
    ln -s "$SOURCE_DIR" "$TARGET_DIR"
    echo "✅ Symlinked $dir!"
done

echo "🎉 Setup complete!"
