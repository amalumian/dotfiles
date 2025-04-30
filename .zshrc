export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM=xterm-256color

# Custom plugins put in ~/.oh-my-zsh/custom/plugins
plugins=(git vi-mode fzf docker docker-compose you-should-use zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias sshhome="cd ~/.ssh"
alias sshconfig="nvim ~/.ssh/config"
alias gitconfig="nvim ~/.gitconfig"
alias vim="nvim"
alias www.malumian.dev="cd ~/Developer/malumian.dev/www.malumian.dev/"
alias dotfiles="cd ~/Developer/dotfiles/"

# PostgreSQL
export PATH="/Library/PostgreSQL/17/bin:$PATH"

# MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# Racket
export PATH="/Applications/Racket v8.16/bin:$PATH"

# asdf
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# GPG Trouble Shooting
export GPG_TTY=$(tty)
