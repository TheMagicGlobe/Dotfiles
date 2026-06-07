# Dotfiles
Universal Dotfiles I use across Linux installations


# 1. Symlink your .zshrc
``` bash
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
    echo "📦 Backed up .zshrc"
fi
rm -f ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
echo "✅ Symlinked .zshrc!"```
```
# 2. Setup the config directories

``` bash
mkdir -p ~/.config

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

for dir in nvim kitty; do
    SOURCE_DIR="$HOME/Dotfiles/$dir"
    TARGET_DIR="$HOME/.config/$dir"

    if [ ! -d "$SOURCE_DIR" ]; then
        echo "⚠️  Warning: Source $SOURCE_DIR not found. Skipping $dir."
        continue
    fi

    if [ -d "$TARGET_DIR" ] && [ ! -L "$TARGET_DIR" ]; then
        BACKUP_DIR="${TARGET_DIR}.backup_${TIMESTAMP}"
        echo "📦 Backing up existing $dir config to $BACKUP_DIR"
        mv "$TARGET_DIR" "$BACKUP_DIR"
    fi

    rm -rf "$TARGET_DIR"

    ln -s "$SOURCE_DIR" "$TARGET_DIR"
    echo "✅ Symlinked $dir!"
done
```

