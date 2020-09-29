#!/bin/bash
sudo apt-get install cmake -y
sudo apt-get install gzip -y
sudo apt-get install libfontconfig1-dev -y
sudo apt-get install libfreetype6-dev -y
sudo apt-get install libxcb-xfixes0-dev -y
sudo apt-get install pkg-config -y
cd
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/alacritty/alacritty.git
cd alacritty
~/.cargo/bin/cargo build --release
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo cp target/release/alacritty /usr/local/bin/.
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo mkdir -p /usr/local/share/man/man1 && gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
# mkdir -p ${ZDOTDIR:-~}/.zsh_functions && echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
# cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
if [ ! -d ~/.local/share/applications ]; then
    mkdir -p ~/.local/share/applications
fi
cp ~/alacritty/extra/linux/Alacritty.desktop ~/.local/share/applications/.
if [ ! -d ~/.config/alacritty ]; then
    mkdir -p ~/.config/alacritty
fi
if [ -f ~/scripts-dotfiles/alacritty.yml ]; then
    cp ~/scripts-dotfiles/alacritty.yml ~/.config/alacritty/.
fi
