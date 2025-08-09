# Paths
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=tmux-256color
export PATH="/Library/PostgreSQL/17/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Racket v8.16/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)
export PAGER="bat"

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# zsh Theme
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

plugins=(git mise docker docker-compose you-should-use zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

# bat Theme
export BAT_THEME="tokyonight_moon"

# Aliases
alias vim="nvim"
alias ls='eza --all --long --group --group-directories-first --icons --header --time-style long-iso'
