#!/bin/bash

# sudo apt-get install emacs -y

EMACS_VERSION="27.1"
FTP_MIRROR="http://gnu.c3sl.ufpr.br/ftp"

echo "Instalando as dependências para compilar o Emacs..."
echo ""
sudo apt-get install libgif-dev -y
sudo apt-get install libgnutls28-dev -y
sudo apt-get install libjpeg-dev -y
sudo apt-get install libtiff-dev -y
sudo apt-get install xorg-dev -y
echo ""

echo "Baixando o código fonte do Emacs..."
echo "Versão do Emacs: ${EMACS_VERSION}"
echo ""
cd
mkdir emacs
cd emacs
wget "${FTP_MIRROR}/emacs/emacs-${EMACS_VERSION}.tar.xz"
tar -xf "emacs-${EMACS_VERSION}.tar.xz"
cd "emacs-${EMACS_VERSION}"
echo ""

echo "Compilando o Emacs..."
echo ""
./configure
make
echo ""

echo "Instalando o Emacs..."
echo ""
sudo make install
cd
rm -rf emacs
echo ""

echo "Instalando o Spacemacs..."
echo ""
git clone https://github.com/syl20bnr/spacemacs "${HOME}/.emacs.d"
if [[ -f "${HOME}/scripts-dotfiles/.spacemacs" ]]; then
    cp "${HOME}/scripts-dotfiles/.spacemacs" "${HOME}/.spacemacs"
fi
