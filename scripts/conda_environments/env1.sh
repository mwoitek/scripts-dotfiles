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

echo -e "${AZUL}Criando o ambiente do Python...${RESET}\\n"
conda create --name env1 python --yes

echo -e "\\n${AZUL}Instalando os pacotes...${RESET}\\n"
conda activate env1
conda install pip --yes
conda install pytest --yes
yes | pip install pynvim
yes | pip install neovim-remote
conda install notedown --yes
conda install matplotlib --yes
conda install numpy --yes
conda install pandas --yes
conda install xlrd --yes
conda install scikit-learn --yes
conda install jupyter --yes
jupyter notebook --generate-config
conda install jupytext --yes
yes | pip install tensorflow
# conda install pillow --yes
# yes | pip install pyspark
# conda install seaborn --yes
# conda install unidecode --yes
conda deactivate

echo -e "\\n${VERDE}Ambiente do Python criado.${RESET}"
