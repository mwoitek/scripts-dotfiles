#!/bin/bash
sudo apt-get install fonts-powerline -y
cd
if [ ! -d .fonts ]; then
    mkdir .fonts
fi
cd .fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
fc-cache -fv
