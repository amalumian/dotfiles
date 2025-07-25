export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=tmux-256color
export PATH="/Library/PostgreSQL/17/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Racket v8.16/bin:$PATH"
export GPG_TTY=$(tty)
export PAGER="bat"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/$HOME/.local/bin/mise activate zsh)"
eval "$(zoxide init zsh --cmd cd)"
