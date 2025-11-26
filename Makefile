.PHONY: git-hooks system homebrew zsh git ssh gnupg mise npm bat eza lazygit nvim tmux kitty ghostty iterm2 aerospace cursor setup

setup: git-hooks system homebrew zsh git ssh gnupg mise npm bat eza lazygit nvim tmux kitty ghostty iterm2 aerospace cursor

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

gnupg:
	./bin/gnupg

mise:
	./bin/mise

npm:
	./bin/npm

bat:
	./bin/bat

eza:
	./bin/eza

lazygit:
	./bin/lazygit

nvim:
	./bin/nvim

tmux:
	./bin/tmux

kitty:
	./bin/kitty

ghostty:
	./bin/ghostty

iterm2:
	./bin/iterm2

aerospace:
	./bin/aerospace

cursor:
	./bin/cursor
