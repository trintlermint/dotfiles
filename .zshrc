# ~/.zshrc

# -------------------------------
# 1️⃣ Load Starship prompt
# -------------------------------
eval "$(starship init zsh)"

# -------------------------------
# 2️⃣ Set basic shell options
# -------------------------------
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Share history across terminals
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Enable command auto-correction
setopt CORRECT

# -------------------------------
# 3️⃣ Useful aliases
# -------------------------------
alias la='exa -l --all --header --git --icons --color=always --time-style=long-iso --group-directories-first'
alias ls='exa --icons --color=always --group-directories-first' # Basic list with icons
alias ll='exa -l --header --git --icons --color=always --time-style=long-iso --group-directories-first' # Long list without hidden files
alias lt='exa -a --tree --level=2 --icons --color=always --group-directories-first' # Show a tree view, 2 levels deeplias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias ..='cd ..'
alias ...='cd ../..'
alias update='sudo pacman -Syu'
alias hx='helix'
alias lg='lazygit'
alias yt='youtube-tui'
# -------------------------------
# Environment variables
# -------------------------------
export TERMINAL=kitty
export EDITOR=hx
export VISUAL=hx
export LANG=en_US.UTF-8
export PATH="$HOME/.local/bin:$PATH"

# -------------------------------
# 5️⃣ Kitty-specific tweaks
# -------------------------------
# Enable Kitty shell integration if installed
if [ -e "$HOME/.config/kitty/kitty.conf" ]; then
    export KITTY_TERM=1
fi

# -------------------------------
# 6️⃣ Optional: Custom functions
# -------------------------------
# Quick directory navigation
mkcd() { mkdir -p "$1" && cd "$1"; }

# Git helper
gco() { git checkout "$1"; }

# ULTIMATE LIST: A rich, two-pane layout with everything you need to know.
function l() {
    exa -l --all --header --git --icons --color=always --time-style=long-iso --group-directories-first --color-scale "$@"
}

# -------------------------------
# Completions
# -------------------------------

# bun completions
[ -s "/home/trintler/.bun/_bun" ] && source "/home/trintler/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# copilot
export HANDLER=copilot
export COPILOT_API_KEY=---------------------------

#ghcup
export PATH="$HOME/.ghcup/bin:$PATH"
[ -f "/home/trintler/.ghcup/env" ] && . "/home/trintler/.ghcup/env" # ghcup-env
