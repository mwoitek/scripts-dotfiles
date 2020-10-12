#!/bin/bash
#
#
#
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
#
#
#
#    ___           __     ____        _      __
#   / _ )___ ____ / /    / __/_______(_)__  / /_
#  / _  / _ `(_-</ _ \  _\ \/ __/ __/ / _ \/ __/
# /____/\_,_/___/_//_/ /___/\__/_/ /_/ .__/\__/
#                                   /_/
#
#
#
# Script que atualiza os programas nos meus computadores que rodam o Debian.

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
sudo apt-get clean

function gitPull() {
    echo ""
    echo "Atualizando $1..."
    if [[ -d "$2" ]]; then
        cd "$2"
        git pull
    else
        echo "O diretório $2 não existe."
    fi
}

gitPull "fzf" "${HOME}/.fzf"
# gitPull "neovim" "${HOME}/neovim"
gitPull "nerd-fonts" "${HOME}/.fonts/nerd-fonts"
gitPull "trash-cli" "${HOME}/trash-cli"

echo ""
echo "Atualizando os plugins do Neovim..."
nvim -c 'PlugUpdate|PlugUpgrade|quitall'
