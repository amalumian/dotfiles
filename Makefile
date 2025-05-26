.PHONY: setup asdf aerospace cursor cursor-extensions font ghostty git gnupg homebrew npm nvim ssh system tmux zed zsh

setup: asdf aerospace cursor cursor-extensions font ghostty git gnupg homebrew npm nvim ssh system tmux zed zsh

aerospace:
	rm -f ~/.aerospace.toml
	ln -snf $(PWD)/aerospace/.aerospace.toml ~/

asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0
	. ~/.asdf/asdf.sh && \
	asdf plugin add nodejs && \
	asdf plugin add golang && \
	asdf plugin add lua && \
	asdf plugin add ruby && \
	asdf install nodejs latest && \
	asdf install golang latest && \
	asdf install lua latest && \
	asdf install ruby latest && \
	asdf global nodejs latest && \
	asdf global golang latest && \
	asdf global lua latest && \
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
	mkdir -p ~/.gnupg
	cp -R $(PWD)/gnupg/. ~/.gnupg/
	@echo "Starting GPG key generation. Please follow the prompts:"
	@echo "  Kind of key: RSA and RSA"
	@echo "  Keysize: 4096"
	@echo "  Expiration: 0 (does not expire)"
	@gpg --full-generate-key
	@echo "Key generated, now configuring git..."
	@KEYID=$$(gpg --list-secret-keys --keyid-format LONG | grep '^sec' | awk '{print $$2}' | cut -d'/' -f2); \
	@echo "KEYID: $$KEYID"; \
	@echo "Public key copied to clipboard"; \
	gpg --armor --export $$KEYID | pbcopy; \
	git config --global user.signingkey $$KEYID; \
	@echo "Git configured to sign commits with key $$KEYID"

homebrew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$$(/opt/homebrew/bin/brew shellenv)" && \
	xargs brew install < $(PWD)/homebrew/formulae.txt && \
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
	mkdir -p ~/.ssh
	@if [ -f ~/.ssh/config ]; then \
		cp ~/.ssh/config ~/.ssh/config.bak.$$(date +%Y%m%d%H%M%S); \
		echo "Backup of existing ~/.ssh/config saved."; \
	fi
	cp $(PWD)/ssh/config ~/.ssh/config
	ssh-keygen -t ed25519 -C "github" -f ~/.ssh/github
	ssh-add --apple-use-keychain ~/.ssh/github
	pbcopy < ~/.ssh/github.pub
	@echo "SSH key generated, added to keychain and public key copied to clipboard."

system:
	defaults write com.apple.dock autohide-delay -float 0
	killall Dock
	defaults write -g NSWindowShouldDragOnGesture -bool true
	defaults write -g ApplePressAndHoldEnabled -bool false

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	rm -f ~/.tmux.conf
	ln -snf $(PWD)/tmux/.tmux.conf ~/

zed:
	rm -f ~/.config/zed/settings.json
	ln -snf $(PWD)/zed/settings.json ~/.config/zed/
	rm -f ~/.config/zed/keymap.json
	ln -snf $(PWD)/zed/keymap.json ~/.config/zed/

zsh:
	rm -f ~/.zshrc
	rm -f ~/.zprofile
	ln -snf $(PWD)/zsh/.zshrc ~/
	ln -snf $(PWD)/zsh/.zprofile ~/
