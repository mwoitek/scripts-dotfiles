#!/bin/bash
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

set -e

EMACS_VERSION="27.1"
FTP_MIRROR="http://gnu.c3sl.ufpr.br/ftp"

RESET="$(tput sgr0)"
VERDE="$(tput setaf 2)"
VERMELHO="$(tput setaf 1)"

echo -e "${VERMELHO}INSTALANDO E CONFIGURANDO O EMACS...${RESET}\\n"

echo -e "Instalando as dependências para compilar o Emacs...\\n"
sudo apt-get install libgif-dev -y
sudo apt-get install libgnutls28-dev -y
sudo apt-get install libjpeg-dev -y
sudo apt-get install libtiff-dev -y
sudo apt-get install xorg-dev -y

echo -e "\\nBaixando o código fonte do Emacs..."
echo -e "Versão do Emacs: ${EMACS_VERSION}\\n"
if [[ -d "${HOME}/emacs" ]]; then
    rm -rf "${HOME}/emacs"
fi
mkdir -p "${HOME}/emacs"
# shellcheck disable=SC2164
cd "${HOME}/emacs"
wget "${FTP_MIRROR}/emacs/emacs-${EMACS_VERSION}.tar.xz"
tar -xf "emacs-${EMACS_VERSION}.tar.xz"
# shellcheck disable=SC2164
cd "emacs-${EMACS_VERSION}"

echo -e "\\nCompilando o Emacs...\\n"
./configure
make

echo -e "\\nInstalando o Emacs...\\n"
sudo make install
# shellcheck disable=SC2164
cd "${HOME}"
rm -rf "${HOME}/emacs"

echo -e "\\nInstalando o Spacemacs...\\n"
git clone https://github.com/syl20bnr/spacemacs "${HOME}/.emacs.d"
# shellcheck disable=SC2164
cd "${HOME}/.emacs.d"
git checkout develop
if [[ -f "${HOME}/scripts-dotfiles/dotfiles/.spacemacs" ]]; then
    cp "${HOME}/scripts-dotfiles/dotfiles/.spacemacs" "${HOME}/.spacemacs"
fi

echo -e "\\n${VERDE}EMACS INSTALADO.${RESET}"
