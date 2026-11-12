# dotfiles

## New Mac (Apple Silicon)

Install Xcode Command Line Tools and wait for the installation to finish:

```sh
xcode-select --install
```

Set up SSH:

```sh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
test ! -f ~/.ssh/config || cp ~/.ssh/config ~/.ssh/config.bak.$(date +%Y%m%d%H%M%S)
cat > ~/.ssh/config <<'EOF'
Host github.com
 HostName github.com
 User git
 IdentityFile ~/.ssh/github
 AddKeysToAgent yes
 UseKeychain yes
EOF
chmod 600 ~/.ssh/config
test -f ~/.ssh/github || ssh-keygen -t ed25519 -C "github" -f ~/.ssh/github -N ""
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/github
pbcopy < ~/.ssh/github.pub
```

Add the copied key to [GitHub SSH keys](https://github.com/settings/ssh/new), then clone:

```sh
git clone git@github.com:amalumian/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles
```

Install mise and set up the machine:

```sh
curl -fsSL https://mise.run | sh && ~/.local/bin/mise trust --all && ~/.local/bin/mise bootstrap
```

If prompted, generate a GPG key and add the copied public key to [GitHub GPG keys](https://github.com/settings/gpg/new). Open a new terminal.

## Update dependencies

```sh
dotupdate
```
