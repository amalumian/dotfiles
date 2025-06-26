.PHONY: homebrew git ssh gnupg zsh asdf npm nvim tmux aerospace ghostty cursor cursor-extensions zed system setup

setup: homebrew git ssh gnupg zsh asdf npm nvim tmux aerospace ghostty cursor cursor-extensions zed system

homebrew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$$(/opt/homebrew/bin/brew shellenv)" && \
	xargs brew install < $(PWD)/homebrew/formulae.txt && \
	xargs brew install --cask < $(PWD)/homebrew/casks.txt
	@echo "The following applications need additional configuration:"
	@echo "  - DeepL: Exclude all programming-related apps"
	@echo "  - AltTab: Set appearance to App Icons"
	@echo "  - Raycast:"
	@echo "    - Set hotkey to CMD + Space"
	@echo "    - Configure navigation bindings to Vim style"
	@echo "    - Set clipboard history hotkey to CMD + Shift + C"
	@echo "The following applications need to be installed manually:"
	@echo "  - Command X"
	@echo "  - Kindle"
	@echo "  - Spark"
	@echo "  - FileZilla"
	@echo "  - PostgreSQL"
	@echo "  - Racket"
	@echo "  - FoXray"
	@echo "  - Electrum"
	@echo "  - Exodus"

git:
	cp -R $(PWD)/git/. ~/

ssh:
	eval "$(ssh-agent -s)"
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

zsh:
	rm -f ~/.zshrc
	rm -f ~/.zprofile
	ln -snf $(PWD)/zsh/.zshrc ~/
	ln -snf $(PWD)/zsh/.zprofile ~/

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

npm:
	xargs npm install -g < $(PWD)/npm/global-packages.txt

nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim
	ln -snf $(PWD)/nvim ~/.config/nvim

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	rm -f ~/.tmux.conf
	ln -snf $(PWD)/tmux/.tmux.conf ~/

aerospace:
	rm -f ~/.aerospace.toml
	ln -snf $(PWD)/aerospace/.aerospace.toml ~/

ghostty:
	rm -f ~/Library/Application\ Support/com.mitchellh.ghostty/config
	ln -snf $(PWD)/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/

cursor:
	rm -f ~/Library/Application\ Support/Cursor/User/keybindings.json
	ln -snf $(PWD)/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/
	rm -f ~/Library/Application\ Support/Cursor/User/settings.json
	ln -snf $(PWD)/cursor/settings.json ~/Library/Application\ Support/Cursor/User/

cursor-extensions:
	@echo "Installing extensions from extensions.txt..."
	@while read extension; do \
		cursor --install-extension "$$extension"; \
	done < $(PWD)/cursor/extensions.txt
	@echo "Checking for extensions that need to be removed..."
	@cursor --list-extensions | while read installed_ext; do \
		if ! grep -q "^$$installed_ext$$" $(PWD)/cursor/extensions.txt; then \
			echo "Removing extension: $$installed_ext"; \
			cursor --uninstall-extension "$$installed_ext"; \
		fi; \
	done
	@echo "Extensions synchronization complete"

zed:
	rm -f ~/.config/zed/settings.json
	ln -snf $(PWD)/zed/settings.json ~/.config/zed/
	rm -f ~/.config/zed/keymap.json
	ln -snf $(PWD)/zed/keymap.json ~/.config/zed/

system:
	@echo "Set dock autohide delay to 0"
	defaults write com.apple.dock autohide-delay -float 0
	@echo "Disable press and hold"
	defaults write -g ApplePressAndHoldEnabled -bool false
	killall Dock || true

	@echo "System Settings:"
	@echo "Appearance:"
	@echo "  - Appearance: Auto"
	@echo "  - Show scroll bars: Always"
	@echo "  - Click in the scroll bar to: Jump to the spot that's clicked"
	@echo "Apple Intelligence & Siri: false"
	@echo "Control Center:"
	@echo "  - Clock: Flash the time separators"
	@echo "  - Automatically hide and show the menu bar: In Full Screen Only"
	@echo "Desktop & Dock:"
	@echo "  - Position on screen: Left"
	@echo "  - Minimize windows using: Scale Effect"
	@echo "  - Animate opening applications: False"
	@echo "  - Automatically hide and show the Dock: True"
	@echo "  - Ask to keep changes when closing documents: True"
	@echo "  - Automatically rearrange Spaces based on most recent use: False"
	@echo "  - Group windows by application: True"
	@echo "  - Prefer tabs when opening documents: Never"
	@echo "  - Drag windows to screen edges to tile: False"
	@echo "  - Drag windows to menu bar to fill screen: False"
	@echo "  - Hold Option key while dragging windows to tile: False"
	@echo "  - Tiled windows have margins: False"
	@echo "  - Stage Manager: False"
	@echo "  - Show recent apps in Stage Manager: False"
	@echo "  - Click wallpaper to reveal desktop: Only in Stage Manager"
	@echo "  - Hot Corners: False"
	@echo "Display:"
	@echo "  - Automatically adjust brightness: False"
	@echo "  - Resolution: 1280x800"
	@echo "Lock Screen:"
	@echo "  - Show 24-hour time: False"
	@echo "Trackpad:"
	@echo "  - Tracking speed: Max"
	@echo "  - Click: Light"
	@echo "  - Dragging style: Three Finger Drag"
	@echo "  - Tap to click: On"
	@echo "  - Notification center: Off"
	@echo "Keyboard:"
	@echo "  - Key repeat rate: Max"
	@echo "  - Delay until repeat: Max"
	@echo "  - Adjust keyboard brightness in low light: False"
	@echo "  - Caps Lock: Control"
	@echo "  - Spotlight: Off"
	@echo "  - Press Globe key to: Do Nothing"
	@echo "  - Keyboard navigation: True"
	@echo "  - Input Sources: English (US), Russian (PC)"
	@echo "  - Correct spelling automatically: False"
	@echo "  - Capitalize words automatically: False"
	@echo "  - Show inline predictive text: False"
	@echo "  - Add period with double-space: False"
	@echo "  - Use smart quotes and dashes: False"
	@echo "  - Dictation: True"
	@echo "Finder:"
	@echo "  - New Finder windows show: Home Directory"
	@echo "  - Show all filename extensions: True"
	@echo "  - Remove items from the Trash: After 30 days"
	@echo "  - Show Path Bar: True"
	@echo "  - Show Status Bar: True"
	@echo "  - Create \"Developer\" directory in home directory"
