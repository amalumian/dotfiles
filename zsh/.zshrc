# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Exports
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export PATH="/Library/PostgreSQL/17/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Racket v8.16/bin:$PATH"
export GPG_TTY=$(tty)

# asdf
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# Aliases
alias zshconfig="nvim $HOME/.zshrc"
alias zshsource="source $HOME/.zshrc"
alias sshconfig="nvim $HOME/.ssh/config"
alias gitconfig="nvim $HOME/.gitconfig"
alias vim="nvim"
alias www.malumian.dev="cd $HOME/Developer/malumian.dev/www.malumian.dev/"
alias dotfiles="cd $HOME/Developer/dotfiles/"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
custom_plugins_dir="$HOME/.oh-my-zsh/custom/plugins"

if [ ! -d "$custom_plugins_dir/you-should-use" ]; then
    echo "Installing you-should-use plugin..."
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$custom_plugins_dir/you-should-use"
fi

if [ ! -d "$custom_plugins_dir/zsh-autocomplete" ]; then
    echo "Installing zsh-autocomplete plugin..."
    git clone https://github.com/marlonrichert/zsh-autocomplete.git "$custom_plugins_dir/zsh-autocomplete"
fi

if [ ! -d "$custom_plugins_dir/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$custom_plugins_dir/zsh-autosuggestions"
fi

if [ ! -d "$custom_plugins_dir/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$custom_plugins_dir/zsh-syntax-highlighting"
fi

plugins=(git vi-mode fzf docker docker-compose you-should-use zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh
