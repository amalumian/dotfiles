export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM=screen-256color

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
alias amalumian="cd ~/Developer/amalumian/"
alias www.malumian.dev="cd ~/Developer/malumian/www.malumian.dev/"
alias finance.malumian.dev="cd ~/Developer/malumian/finance.malumian.dev/"
alias dotfiles="cd ~/Developer/dotfiles/"

# PostgreSQL
export PATH="/Library/PostgreSQL/17/bin:$PATH"

# MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# Racket
export PATH="/Applications/Racket v8.14/bin:$PATH"

# asdf
export ASDF_DIR="$HOME/.asdf"
. "$ASDF_DIR/asdf.sh"
. "$ASDF_DIR/completions/asdf.bash"
