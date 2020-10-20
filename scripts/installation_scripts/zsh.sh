#!/bin/bash
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

RESET="$(tput sgr0)"
VERDE="$(tput setaf 2)"
VERMELHO="$(tput setaf 1)"

echo -e "${VERMELHO}INSTALANDO E CONFIGURANDO O ZSH...${RESET}\\n"

echo -e "Instalando o zsh...\\n"
sudo apt-get install zsh -y

echo -e "\\nInstalando o oh-my-zsh...\\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\\nInstalando mais alguns plugins...\\n"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "${ZSH_CUSTOM}/plugins/you-should-use"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
sudo apt-get install autojump -y
sudo apt-get install zsh-syntax-highlighting -y

echo -e "\\n${VERDE}ZSH INSTALADO.${RESET}"
