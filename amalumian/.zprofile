# evals
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/$HOME/.local/bin/mise activate zsh)"
eval "$(zoxide init zsh --cmd cd)"

# Variables
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=tmux-256color
export GPG_TTY=$(tty)
export PAGER="bat"
export BAT_THEME="tokyonight_moon"

# PATHs
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
