#!/bin/bash
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

AZUL="$(tput setaf 4)"
RESET="$(tput sgr0)"
VERDE="$(tput setaf 2)"

echo -e "${AZUL}Criando o ambiente do C...${RESET}\\n"
conda create --name env2 icc_rt --yes

echo -e "\\n${AZUL}Instalando os pacotes...${RESET}\\n"
conda activate env2
conda install clang --yes
conda install libgcc-ng --yes
conda deactivate

echo -e "\\n${VERDE}Ambiente do C criado.${RESET}"
