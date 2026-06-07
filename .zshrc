# ==========================================
# 1. History (Required for autosuggestions to work)
# ==========================================
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history

# ==========================================
# 2. Native Tab Autocomplete Menu
# ==========================================
# Initialize the built-in completion system
autoload -U compinit; compinit

# Force the completion system to display an interactive, navigable menu
zstyle ':completion:*' menu yes select

# ==========================================
# 3. Native Custom Prompt
# ==========================================
# Zsh uses special codes to build the prompt:
# %F{color} sets text color, %f resets it
# %B makes it bold, %b resets bold 
# %~ displays the current directory path
PROMPT='%B%F{cyan}%~ %F{green}❯%f%b '

# ==========================================
# 4. Source Native Packages
# ==========================================
# --- For Arch Linux ---
 source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
 source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
