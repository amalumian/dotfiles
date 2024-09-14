.PHONY: setup nvim zsh p10k

setup: nvim zsh p10k

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
