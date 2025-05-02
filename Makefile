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
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	rm -f ~/.tmux.conf
	ln -snf $(PWD)/.tmux.conf ~/

aerospace:
	rm -f ~/.aerospace.toml
	ln -snf $(PWD)/.aerospace.toml ~/

alacritty:
	rm -rf ~/.config/alacritty
	ln -snf $(PWD)/alacritty ~/.config/alacritty

ghostty:
	rm -f ~/Library/Application\ Support/com.mitchellh.ghostty/config
	ln -snf $(PWD)/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/

cursor:
	rm -f ~/Library/Application\ Support/Cursor/User/keybindings.json
	ln -snf $(PWD)/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/
	rm -f ~/Library/Application\ Support/Cursor/User/settings.json
	ln -snf $(PWD)/cursor/settings.json ~/Library/Application\ Support/Cursor/User/

zed:
	rm -f ~/.config/zed/settings.json
	ln -snf $(PWD)/zed/settings.json ~/.config/zed/
	rm -f ~/.config/zed/keymap.json
	ln -snf $(PWD)/zed/keymap.json ~/.config/zed/

ssh:
	mkdir ~/.ssh
	cd ~/.ssh
	ssh-keygen -t ed25519 -C "github"
	ssh-keygen -y -f github
	touch ~/.ssh/config
	echo -e "Host *\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/github" >> ~/.ssh/config
	ssh-add --apple-use-keychain ~/.ssh/github
	cat ~/.ssh/github.pub | pbcopy
