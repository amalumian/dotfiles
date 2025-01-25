.PHONY: setup nvim zsh p10k tmux aerospace kitty

setup: nvim zsh p10k tmux aerospace kitty

nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim
	ln -snf $(PWD)/nvim ~/.config/nvim

zsh:
	rm -f ~/.zshrc
	ln -snf $(PWD)/.zshrc ~/

p10k:
	rm -f ~/.p10k.zsh
	ln -snf $(PWD)/.p10k.zsh ~/

tmux:
	rm -f ~/.tmux.conf
	ln -snf $(PWD)/.tmux.conf ~/

aerospace:
	rm -f ~/.aerospace.toml
	ln -snf $(PWD)/.aerospace.toml ~/

kitty:
	rm -rf ~/.config/kitty
	ln -snf $(PWD)/kitty ~/.config/kitty
