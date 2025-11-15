.PHONY: git-hooks system homebrew zsh git ssh gnupg mise npm bat eza lazygit nvim tmux kitty aerospace cursor setup

setup: git-hooks system homebrew zsh git ssh gnupg mise npm bat eza lazygit nvim tmux kitty aerospace cursor

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

aerospace:
	./bin/aerospace

cursor:
	./bin/cursor
