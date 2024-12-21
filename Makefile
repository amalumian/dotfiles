.PHONY: setup nvim zsh p10k tmux aerospace kitty

setup: nvim zsh p10k tmux aerospace kitty

nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim
	ln -snf $(PWD)/nvim ~/.config/nvim

zsh:
	rm ~/.zshrc
	ln -snf $(PWD)/.zshrc ~/

p10k:
	rm ~/.p10k.zsh
	ln -snf $(PWD)/.p10k.zsh ~/

tmux:
	rm ~/.tmux.conf
	ln -snf $(PWD)/.tmux.conf ~/

aerospace:
	rm ~/.aerospace.toml
	ln -snf $(PWD)/.aerospace.toml ~/

kitty:
	rm -rf ~/.config/kitty
	ln -snf $(PWD)/kitty ~/.config/kitty
