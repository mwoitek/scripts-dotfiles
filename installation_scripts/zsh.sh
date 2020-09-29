#!/bin/bash
sudo apt-get install zsh -y
sudo apt-get install curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo apt-get install autojump -y
sudo apt-get install zsh-syntax-highlighting -y
