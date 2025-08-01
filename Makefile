.PHONY: git-hooks homebrew git ssh gnupg zsh bat eza mise npm nvim lazygit tmux aerospace borders ghostty cursor cursor-extensions zed system setup

setup: git-hooks homebrew git ssh gnupg zsh bat eza mise npm nvim lazygit tmux aerospace borders ghostty cursor cursor-extensions zed system

git-hooks:
	@echo "Installing git hooks..."
	@ln -sf "$$(pwd)/.git-hooks/prepare-commit-msg" .git/hooks/prepare-commit-msg
	@chmod +x .git/hooks/prepare-commit-msg
	@echo "Hook installed: .git/hooks/prepare-commit-msg"

homebrew:
	@echo "Installing Homebrew..."
	@if ! command -v brew >/dev/null 2>&1; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi
	@echo "Installing Homebrew packages..."
	@if [ -f /opt/homebrew/bin/brew ]; then \
		eval "$$(/opt/homebrew/bin/brew shellenv)"; \
	fi
	@if [ -f $(PWD)/homebrew/formulae.txt ]; then \
		xargs -I {} brew install {} < $(PWD)/homebrew/formulae.txt || echo "Some formulae failed to install"; \
	fi
	@if [ -f $(PWD)/homebrew/casks.txt ]; then \
		xargs -I {} brew install --cask {} < $(PWD)/homebrew/casks.txt || echo "Some casks failed to install"; \
	fi
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
	@echo "  - Fade In"
	@echo "  - DaVinci Resolve"
	@echo "  - Steam"
	@echo "  - Aseprite"
	@echo "  - Blender"
	@echo "  - Godot"
	@echo "  - Battle.net"
	@echo "  - League of Legends"
	@echo "  - balenaEtcher"

git:
	cp -R $(PWD)/git/. ~/

ssh:
	@echo "Setting up SSH..."
	@eval "$(ssh-agent -s)" || echo "SSH agent already running"
	mkdir -p ~/.ssh
	@if [ -f ~/.ssh/config ]; then \
		cp ~/.ssh/config ~/.ssh/config.bak.$$(date +%Y%m%d%H%M%S); \
		echo "Backup of existing ~/.ssh/config saved."; \
	fi
	cp $(PWD)/ssh/config ~/.ssh/config
	@if [ ! -f ~/.ssh/github ]; then \
		echo "Generating SSH key..."; \
		ssh-keygen -t ed25519 -C "github" -f ~/.ssh/github -N ""; \
	else \
		echo "SSH key already exists"; \
	fi
	@ssh-add --apple-use-keychain ~/.ssh/github || echo "SSH key already in keychain"
	@if [ -f ~/.ssh/github.pub ]; then \
		pbcopy < ~/.ssh/github.pub; \
		echo "SSH key generated, added to keychain and public key copied to clipboard."; \
	else \
		echo "SSH public key not found"; \
	fi

gnupg:
	mkdir -p ~/.gnupg
	cp -R $(PWD)/gnupg/. ~/.gnupg/
	chmod 700 ~/.gnupg
	chmod 700 ~/.gnupg/*
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

bat:
	@echo "Setting up bat..."
	@mkdir -p "$(bat --config-dir)/themes" 2>/dev/null || echo "bat not installed, skipping"
	@cd "$(bat --config-dir)/themes" 2>/dev/null && \
	curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_moon.tmTheme 2>/dev/null || echo "Failed to download theme"
	@bat cache --build 2>/dev/null || echo "bat not installed"

eza:
	mkdir -p ~/Library/Application\ Support/eza
	ln -snf $(PWD)/eza/theme.yml ~/Library/Application\ Support/eza/

mise:
	@echo "Installing mise..."
	@if ! command -v mise >/dev/null 2>&1; then \
		curl -fsSL https://mise.run | sh; \
	fi
	@if [ -f ~/.local/bin/mise ]; then \
		. ~/.local/bin/mise && mise use --global node@22 lua@5.1; \
	elif command -v mise >/dev/null 2>&1; then \
		mise use --global node@22 lua@5.1; \
	else \
		echo "mise not available"; \
	fi

npm:
	@echo "Installing global npm packages..."
	@if [ -f $(PWD)/npm/global-packages.txt ]; then \
		xargs -I {} npm install -g {} < $(PWD)/npm/global-packages.txt || echo "Some npm packages failed to install"; \
	else \
		echo "npm/global-packages.txt not found"; \
	fi

nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
	rm -rf ~/.cache/nvim
	ln -snf $(PWD)/nvim ~/.config/nvim

lazygit:
	rm -f ~/Library/Application\ Support/lazygit/config.yml
	ln -snf $(PWD)/lazygit/config.yml ~/Library/Application\ Support/lazygit/

tmux:
	@echo "Setting up tmux..."
	@if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	else \
		echo "TPM already installed"; \
	fi
	rm -f ~/.tmux.conf
	ln -snf $(PWD)/tmux/.tmux.conf ~/

aerospace:
	rm -f ~/.aerospace.toml
	ln -snf $(PWD)/aerospace/.aerospace.toml ~/

borders:
	@echo "Installing borders..."
	@brew tap FelixKratz/formulae 2>/dev/null || echo "Failed to tap formula"
	@brew install borders 2>/dev/null || echo "Failed to install borders"

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
	@if [ -f $(PWD)/cursor/extensions.txt ]; then \
		while read extension; do \
			cursor --install-extension "$$extension" 2>/dev/null || echo "Failed to install extension: $$extension"; \
		done < $(PWD)/cursor/extensions.txt; \
	else \
		echo "cursor/extensions.txt not found"; \
	fi
	@echo "Checking for extensions that need to be removed..."
	@if command -v cursor >/dev/null 2>&1; then \
		cursor --list-extensions 2>/dev/null | while read installed_ext; do \
			if ! grep -q "^$$installed_ext$$" $(PWD)/cursor/extensions.txt 2>/dev/null; then \
				echo "Removing extension: $$installed_ext"; \
				cursor --uninstall-extension "$$installed_ext" 2>/dev/null; \
			fi; \
		done; \
	else \
		echo "cursor command not found"; \
	fi
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
	killall Dock 2>/dev/null || true
	@echo "Disable windows opening animations"
	defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

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
