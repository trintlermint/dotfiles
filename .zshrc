# ~/.zshrc

# -- initialisation

# starship.toml init
eval "$(starship init zsh)"

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# cmd history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# command autocorrection
setopt CORRECT

# -- aliases

alias la='exa -l --all --header --git --icons --color=always --time-style=long-iso --group-directories-first'
alias ls='exa --icons --color=always --group-directories-first' # Basic list with icons
alias ll='exa -l --header --git --icons --color=always --time-style=long-iso --group-directories-first' # long list without hidden files
alias lt='exa -a --tree --level=2 --icons --color=always --group-directories-first' # tree view, 2 levels
alias ..='cd ..'
alias ...='cd ../..'
alias upd='yay -Syu'
alias hx='helix'
alias lg='lazygit'
alias yt='youtube-tui'

# -- env variables

export TERMINAL=kitty
export EDITOR=hx
export VISUAL=hx
export LANG=en_US.UTF-8
export PATH="$HOME/.local/bin:$PATH"

# -- kitty shell integration

if [ -e "$HOME/.config/kitty/kitty.conf" ]; then
    export KITTY_TERM=1
fi

# -- custom functions

# mkdir + cd
mkcd() { mkdir -p "$1" && cd "$1"; }

# two pane layout with most stuff and functions.
function l() {
    exa -l --all --header --git --icons --color=always --time-style=long-iso --group-directories-first --color-scale "$@"
}

# setup a directory searcher through a folder using fzf for when you cant bother to use cd 1000 times
function work() {
  local base_dir=~ #/ work base directory here
  # find all subdirectories, display relative to base_dir
  local dirs
  dirs=($(find "$base_dir" -type d | sed "s|$base_dir/||" | grep -v '^$'))
  if (( ${#dirs[@]} == 0 )); then
    echo "No subdirectories found in $base_dir"
    return 1
  fi
  local selected=$(printf "%s\n" "${dirs[@]}" | fzf --prompt="sel dir : " --height=20)
  if [[ -n "$selected" ]]; then
    cd "$base_dir/$selected"
  else
    echo "no selection made."
  fi
}

# -- completions

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
