# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM=screen-256color

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf vi-mode fzf docker docker-compose you-should-use zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Edit global zsh configuration
alias zshconfig="nvim ~/.zshrc"
# Reload zsh configuration
alias zshsource="source ~/.zshrc"
# Navigate to oh-my-zsh directory
alias ohmyzsh="cd ~/.oh-my-zsh"
# Navigate to global ssh directory
alias sshhome="cd ~/.ssh"
# Edit global ssh configuration
alias sshconfig="nvim ~/.ssh/config"
# Edit global git configuration
alias gitconfig="nvim ~/.gitconfig"
# Use vim instead of nvim
alias vim="nvim"
# Navigate to amalumian directory
alias amalumian="cd ~/Developer/amalumian/"
# Navigate to www.amalumian.dev directory
alias www.malumian.dev="cd ~/Developer/malumian/www.malumian.dev/"
# Navigate to finance.amalumian.dev directory
alias finance.malumian.dev="cd ~/Developer/malumian/finance.malumian.dev/"
# Navigate to dotfiles directory
alias dotfiles="cd ~/Developer/dotfiles/"
# Navigate to nvim directory
alias nvimconfig="cd ~/Developer/dotfiles/nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keys to normal navigation by words in terminal
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

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
