.PHONY: setup asdf aerospace cursor cursor-extensions font ghostty git gnupg homebrew npm nvim ssh tmux zsh

setup: asdf aerospace cursor cursor-extensions font ghostty git gnupg homebrew npm nvim ssh tmux zsh

aerospace:
	rm -f ~/.aerospace.toml
	ln -snf $(PWD)/aerospace/.aerospace.toml ~/

asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0
	. ~/.asdf/asdf.sh
	asdf plugin add nodejs
	asdf plugin add golang
	asdf plugin add lua
	asdf plugin add ruby
	asdf install nodejs latest
	asdf install golang latest
	asdf install lua latest
	asdf install ruby latest
	asdf global nodejs latest
	asdf global golang latest
	asdf global lua latest
	asdf global ruby latest

cursor:
	rm -f ~/Library/Application\ Support/Cursor/User/keybindings.json
	ln -snf $(PWD)/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/
	rm -f ~/Library/Application\ Support/Cursor/User/settings.json
	ln -snf $(PWD)/cursor/settings.json ~/Library/Application\ Support/Cursor/User/

cursor-extensions:
	while read extension; do \
		cursor --install-extension "$$extension"; \
	done < $(PWD)/cursor/extensions.txt

font:
	brew tap homebrew/cask-fonts
	brew install --cask font-iosevka-nerd-font

ghostty:
	rm -f ~/Library/Application\ Support/com.mitchellh.ghostty/config
	ln -snf $(PWD)/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/

git:
	cp -R $(PWD)/git/. ~/

gnupg:
	cp -R $(PWD)/gnupg/. ~/.gnupg/

homebrew:
	xargs brew install < $(PWD)/homebrew/formulae.txt
	xargs brew install --cask < $(PWD)/homebrew/casks.txt

npm:
	xargs npm install -g < $(PWD)/npm/global-packages.txt

nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim
	ln -snf $(PWD)/nvim ~/.config/nvim

ssh:
	mkdir ~/.ssh
	cd ~/.ssh
	ssh-keygen -t ed25519 -C "github"
	ssh-keygen -y -f github
	touch ~/.ssh/config
	echo -e "Host *\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/github" >> ~/.ssh/config
	ssh-add --apple-use-keychain ~/.ssh/github
	cat ~/.ssh/github.pub | pbcopy

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	rm -f ~/.tmux.conf
	ln -snf $(PWD)/tmux/.tmux.conf ~/

zsh:
	rm -f ~/.zshrc
	ln -snf $(PWD)/zsh/.zshrc ~/
