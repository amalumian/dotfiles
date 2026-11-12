.PHONY: git-hooks system homebrew zsh git ssh starship gnupg mise npm bat lazygit nvim vim tmux btop ghostty karabiner setup

setup: git-hooks system homebrew zsh git ssh starship gnupg mise npm bat lazygit nvim vim tmux btop ghostty karabiner

git-hooks:
	./bin/git-hooks

system:
	./bin/system

homebrew:
	./bin/homebrew

zsh:
	./bin/zsh

git:
	./bin/git

ssh:
	./bin/ssh

starship:
	./bin/starship

gnupg:
	./bin/gnupg

mise:
	./bin/mise

npm:
	./bin/npm

bat:
	./bin/bat

lazygit:
	./bin/lazygit

nvim:
	./bin/nvim

tmux:
	./bin/tmux

btop:
	./bin/btop

ghostty:
	./bin/ghostty

karabiner:
	./bin/karabiner
