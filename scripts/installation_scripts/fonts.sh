#!/bin/bash
sudo apt-get install fonts-powerline -y
# The 'contrib' component of the Debian repositories has to be enabled for the following command to work.
# It may be necessary to edit the file '/etc/apt/sources.list'.
sudo apt-get install ttf-mscorefonts-installer -y
cd
[[ ! -d .fonts ]] && mkdir .fonts
cd .fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
fc-cache -fv
