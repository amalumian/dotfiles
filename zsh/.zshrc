# Aliases
alias vim="nvim"
alias zshconfig="nvim $HOME/.zshrc"
alias zshsource="source $HOME/.zshrc"
alias sshconfig="nvim $HOME/.ssh/config"
alias gitconfig="nvim $HOME/.gitconfig"
alias dotfiles="cd $HOME/Developer/dotfiles/"
alias index="cd $HOME/Developer/malumian/index/"
alias www="cd $HOME/Developer/malumian/www/"
alias finance="cd $HOME/Developer/malumian/finance/"

# asdf
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Theme
ZSH_THEME="robbyrussell"

# Plugins
PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"

if [ ! -d "$PLUGINS_DIR/you-should-use" ]; then
    echo "Installing you-should-use plugin..."
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$PLUGINS_DIR/you-should-use"
fi

if [ ! -d "$PLUGINS_DIR/zsh-autocomplete" ]; then
    echo "Installing zsh-autocomplete plugin..."
    git clone https://github.com/marlonrichert/zsh-autocomplete.git "$PLUGINS_DIR/zsh-autocomplete"
fi

if [ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGINS_DIR/zsh-autosuggestions"
fi

if [ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"
fi

plugins=(git vi-mode fzf docker docker-compose you-should-use zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh
