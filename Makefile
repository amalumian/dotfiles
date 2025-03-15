.PHONY: setup nvim zsh tmux aerospace

setup: nvim zsh tmux aerospace

nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim
	ln -snf $(PWD)/nvim ~/.config/nvim

zsh:
	rm -f ~/.zshrc
	ln -snf $(PWD)/.zshrc ~/

tmux:
	rm -f ~/.tmux.conf
	ln -snf $(PWD)/.tmux.conf ~/

aerospace:
	rm -f ~/.aerospace.toml
	ln -snf $(PWD)/.aerospace.toml ~/

ssh:
	mkdir ~/.ssh
	cd ~/.ssh
	ssh-keygen -t ed25519 -C "github"
	ssh-keygen -y -f gitHub
	touch ~/.ssh/config
	echo -e "Host *\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/github" >> ~/.ssh/config
	ssh-add --apple-use-keychain ~/.ssh/github
	cat ~/.ssh/id_rsa.pub | pbcopy
