# Dotfiles
Universal Dotfiles I use across Linux installations


# 1. Symlink your .zshrc
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then mv ~/.zshrc ~/.zshrc.backup; echo "📦 Backed up .zshrc"; fi; rm -f ~/.zshrc; ln -s ~/dotfiles/.zshrc ~/.zshrc; echo "✅ Symlinked .zshrc!"

# 2. Setup the config directories
mkdir -p ~/.config
for dir in nvim kitty; do
    SOURCE_DIR="$HOME/dotfiles/configs/$dir"
    TARGET_DIR="$HOME/.config/$dir"

    # Back up if it exists and isn't a symlink
    if [ -d "$TARGET_DIR" ] && [ ! -L "$TARGET_DIR" ]; then
        echo "📦 Backing up existing $TARGET_DIR to ${TARGET_DIR}.backup"
        mv "$TARGET_DIR" "${TARGET_DIR}.backup"
    fi
    
    # Remove old symlinks/empty dirs and create the new one
    rm -rf "$TARGET_DIR"
    ln -s "$SOURCE_DIR" "$TARGET_DIR"
    echo "✅ Symlinked $dir!"
done
