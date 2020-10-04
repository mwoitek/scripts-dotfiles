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
cd ~/.fonts/nerd-fonts
git pull
cd ~/.fzf
git pull
cd ~/trash-cli
git pull
