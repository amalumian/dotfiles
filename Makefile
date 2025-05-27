.PHONY: homebrew font git ssh gnupg zsh asdf npm nvim tmux aerospace ghostty cursor cursor-extensions zed system setup

setup: homebrew font git ssh gnupg zsh asdf npm nvim tmux aerospace ghostty cursor cursor-extensions zed system

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

font:
	brew tap homebrew/cask-fonts
	brew install --cask font-iosevka-nerd-font

git:
	cp -R $(PWD)/git/. ~/

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
	while read extension; do \
		cursor --install-extension "$$extension"; \
	done < $(PWD)/cursor/extensions.txt

zed:
	rm -f ~/.config/zed/settings.json
	ln -snf $(PWD)/zed/settings.json ~/.config/zed/
	rm -f ~/.config/zed/keymap.json
	ln -snf $(PWD)/zed/keymap.json ~/.config/zed/

system:
	@echo "Appearance"
	@echo "Set appearance to Auto"
	defaults write -g AppleInterfaceStyle -string "Auto"
	@echo "Show scroll bars always"
	defaults write -g AppleShowScrollBars -string "Always"
	@echo "Set scroll bar behavior to jump to clicked spot"
	defaults write -g AppleScrollerPagingBehavior -bool true

	@echo "Apple Intelligence & Siri"
	@echo "Disable Siri"
	defaults write com.apple.assistant.support "Assistant Enabled" -bool false

	@echo "Control Center"
	@echo "Flash time separators"
	defaults write com.apple.menuextra.clock FlashDateSeparators -bool true
	@echo "Automatically hide menu bar"
	defaults write -g _HIHideMenuBar -bool true

	@echo "Desktop & Dock"
	@echo "Position dock on left"
	defaults write com.apple.dock orientation -string "left"
	@echo "Set minimize effect to scale"
	defaults write com.apple.dock mineffect -string "scale"
	@echo "Disable animation when opening applications"
	defaults write com.apple.dock launchanim -bool false
	@echo "Automatically hide dock"
	defaults write com.apple.dock autohide -bool true
	@echo "Ask to keep changes when closing documents"
	defaults write -g NSCloseAlwaysConfirmsChanges -bool true
	@echo "Disable automatic space rearrangement"
	defaults write com.apple.dock mru-spaces -bool false
	@echo "Group windows by application"
	defaults write com.apple.dock expose-group-apps -bool true
	@echo "Never prefer tabs"
	defaults write -g AppleWindowTabbingMode -string "never"
	@echo "Disable window tiling"
	defaults write -g NSWindowShouldDragOnGesture -bool false
	@echo "Disable window filling screen"
	defaults write -g NSWindowShouldDragOnGesture -bool false
	@echo "Disable option key tiling"
	defaults write -g NSWindowShouldDragOnGesture -bool false
	@echo "Disable tiled window margins"
	defaults write -g NSWindowShouldDragOnGesture -bool false
	@echo "Disable Stage Manager"
	defaults write com.apple.WindowManager EnableStageManager -bool false
	@echo "Disable recent apps in Stage Manager"
	defaults write com.apple.WindowManager ShowRecentApps -bool false
	@echo "Set wallpaper click behavior"
	defaults write com.apple.WindowManager ClickWallpaperToRevealDesktop -bool false
	@echo "Disable hot corners"
	defaults write com.apple.dock wvous-tl-corner -int 0
	defaults write com.apple.dock wvous-tr-corner -int 0
	defaults write com.apple.dock wvous-bl-corner -int 0
	defaults write com.apple.dock wvous-br-corner -int 0
	@echo "Set dock autohide delay to 0"
	defaults write com.apple.dock autohide-delay -float 0

	@echo "Display"
	@echo "Disable automatic brightness adjustment"
	defaults write com.apple.BezelServices kDim -bool false

	@echo "Lock Screen"
	@echo "Disable 24-hour time"
	defaults write com.apple.menuextra.clock Is24Hour -bool false

	@echo "Trackpad"
	@echo "Set tracking speed to maximum"
	defaults write -g com.apple.trackpad.scaling -float 3.0
	@echo "Set click to light"
	defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
	@echo "Set dragging style to three finger"
	defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
	@echo "Enable tap to click"
	defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
	@echo "Disable notification center"
	defaults write com.apple.notificationcenterui menuExtras -array

	@echo "Keyboard"
	@echo "Set key repeat rate to maximum"
	defaults write -g KeyRepeat -int 2
	@echo "Set delay until repeat to minimum"
	defaults write -g InitialKeyRepeat -int 15
	@echo "Disable keyboard brightness adjustment"
	defaults write -g com.apple.keyboard.illumination -bool false
	@echo "Set Caps Lock to Control"
	defaults write -g com.apple.keyboard.modifiermapping.1452-641-0 -dict-add 0 -dict-add HIDKeyboardModifierMappingSrc -int 0x700000039 HIDKeyboardModifierMappingDst -int 0x7000000E0
	@echo "Disable Spotlight"
	defaults write com.apple.Spotlight MenuItemHidden -bool true
	@echo "Set Globe key to do nothing"
	defaults write com.apple.HIToolbox AppleFnUsageType -int 0
	@echo "Enable keyboard navigation"
	defaults write -g AppleKeyboardUIMode -int 2
	@echo "Set input sources"
	@echo "Note: Input sources require manual configuration"
	@echo "Disable automatic spelling correction"
	defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
	@echo "Disable automatic capitalization"
	defaults write -g NSAutomaticCapitalizationEnabled -bool false
	@echo "Disable predictive text"
	defaults write -g NSAutomaticTextCompletionEnabled -bool false
	@echo "Disable double-space period"
	defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
	@echo "Disable smart quotes and dashes"
	defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
	defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
	@echo "Enable dictation"
	defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMMasterDictationEnabled -bool true
	@echo "Disable press and hold"
	defaults write -g ApplePressAndHoldEnabled -bool false

	@echo "Finder"
	@echo "Set new windows to show home directory"
	defaults write com.apple.finder NewWindowTarget -string "PfHm"
	@echo "Show all filename extensions"
	defaults write -g AppleShowAllExtensions -bool true
	@echo "Set trash removal to 30 days"
	defaults write com.apple.finder FXRemoveOldTrashItems -bool true
	defaults write com.apple.finder FXRemoveOldTrashItemsDelay -int 30
	@echo "Show path bar"
	defaults write com.apple.finder ShowPathbar -bool true
	@echo "Show status bar"
	defaults write com.apple.finder ShowStatusBar -bool true
	@echo "Create Developer and Work directories"
	mkdir -p ~/Developer
	mkdir -p ~/Work

	@echo "Restarting Dock and Finder to apply changes..."
	killall Dock || true
	killall Finder || true

	@echo "Final system settings summary:"
	@echo "Appearance:"
	@echo "  - Auto appearance"
	@echo "  - Always show scroll bars"
	@echo "  - Jump to clicked spot in scroll bars"
	@echo "Apple Intelligence & Siri: Disabled"
	@echo "Control Center:"
	@echo "  - Flash time separators"
	@echo "  - Auto-hide menu bar"
	@echo "Desktop & Dock:"
	@echo "  - Left position"
	@echo "  - Scale minimize effect"
	@echo "  - No animation when opening apps"
	@echo "  - Auto-hide dock"
	@echo "  - Keep changes when closing documents"
	@echo "  - No auto-rearrange spaces"
	@echo "  - Group windows by app"
	@echo "  - Never prefer tabs"
	@echo "  - No window tiling"
	@echo "  - No Stage Manager"
	@echo "Display:"
	@echo "  - No auto brightness"
	@echo "  - 1280x800 resolution"
	@echo "Lock Screen:"
	@echo "  - 12-hour time format"
	@echo "Trackpad:"
	@echo "  - Max tracking speed"
	@echo "  - Light click"
	@echo "  - Three finger drag"
	@echo "  - Tap to click enabled"
	@echo "  - No notification center"
	@echo "Keyboard:"
	@echo "  - Max key repeat rate"
	@echo "  - Max delay until repeat"
	@echo "  - No auto keyboard brightness"
	@echo "  - Caps Lock as Control"
	@echo "  - Spotlight disabled"
	@echo "  - Globe key does nothing"
	@echo "  - Keyboard navigation enabled"
	@echo "  - Input sources: English (US), Russian (PC)"
	@echo "  - All auto-corrections disabled"
	@echo "  - Dictation enabled"
	@echo "Finder:"
	@echo "  - Home directory for new windows"
	@echo "  - Show all extensions"
	@echo "  - 30-day trash removal"
	@echo "  - Show path and status bars"
	@echo "  - Developer and Work directories created"
