.PHONY: git-hooks system homebrew zsh git ssh starship gnupg mise npm bat eza lazygit nvim vim tmux btop kitty zed aerospace setup

setup: git-hooks system homebrew zsh git ssh starship gnupg mise npm bat eza lazygit nvim vim tmux btop kitty zed aerospace

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

eza:
	./bin/eza

lazygit:
	./bin/lazygit

nvim:
	./bin/nvim

tmux:
	./bin/tmux

btop:
	./bin/btop

kitty:
	./bin/kitty

zed:
	./bin/zed

aerospace:
	./bin/aerospace
