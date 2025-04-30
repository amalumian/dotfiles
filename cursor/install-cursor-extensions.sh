#!/bin/bash

while read extension; do
    cursor --install-extension "$extension"
done < "$HOME/Developer/dotfiles/cursor/cursor-extensions.txt"
