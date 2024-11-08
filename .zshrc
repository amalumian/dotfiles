# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# edit global zsh configuration
alias zshconfig="nvim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"
# navigate to oh-my-zsh directory
alias ohmyzsh="cd ~/.oh-my-zsh"
# navigate to global ssh directory
alias sshhome="cd ~/.ssh"
# edit global ssh configuration
alias sshconfig="nvim ~/.ssh/config"
# edit global git configuration
alias gitconfig="nvim ~/.gitconfig"
# vim instead of nvim
alias vim="nvim"

# Function to search directories and change to the selected one
cdf() {
  cd $(find ~/Developer -type d -not -path "*/node_modules/*" | fzf)
}
# Function to search files and open the selected one in Vim
vf() {
  local file=$(find ~/Developer -type f -not -path "*/node_modules/*" | fzf)
  [ -n "$file" ] && vim "$file"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PostgreSQL
export PATH="/Library/PostgreSQL/16/bin:$PATH"

# Racket
export PATH="/Applications/Racket v8.14/bin:$PATH"

# Keys to normal navigation by words in terminal
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
