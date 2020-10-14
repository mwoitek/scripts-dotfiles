#!/bin/bash
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
# Script que configura o Miniconda.

AZUL="$(tput setaf 4)"
RESET="$(tput sgr0)"
VERDE="$(tput setaf 2)"
VERMELHO="$(tput setaf 1)"

echo -e "${AZUL}CONFIGURANDO O MINICONDA...${RESET}\\n"

echo -e "${AZUL}Criando o arquivo com a configuração básica...${RESET}\\n"
CONDARC="${HOME}/.condarc"
touch "${CONDARC}"
conda config --file "${CONDARC}" --append channels intel
conda config --file "${CONDARC}" --prepend channels conda-forge
conda config --file "${CONDARC}" --set changeps1 false
conda config --file "${CONDARC}" --set channel_priority false
echo -e "${VERDE}Arquivo criado.${RESET}\\n"

# Define um array que armazena os nomes dos scripts que criam os ambientes do Conda:
declare -ga SCRIPTS
SCRIPTS_DIR=$(dirname "$0")
SCRIPTS=(
    "${SCRIPTS_DIR}/env1.sh"
    "${SCRIPTS_DIR}/env2.sh"
    "${SCRIPTS_DIR}/env3.sh"
)

# Função que roda um script somente quando o arquivo correspondente existe:
createEnv() {
    SCRIPT="$1"
    if [[ -f "${SCRIPT}" ]]; then
        bash "${SCRIPT}"
    else
        echo "${VERMELHO}O script ${SCRIPT} não foi encontrado.${RESET}"
    fi
}

# Função que roda os scripts acima e cria todos os meus ambientes do Conda:
createEnvs() {
    for SCRIPT in "${SCRIPTS[@]}"; do
        createEnv "${SCRIPT}"
        echo
    done
}

echo -e "${AZUL}Criando os meus ambientes do Conda...${RESET}\\n"
createEnvs
echo -e "${VERDE}Ambientes criados.${RESET}\\n"

echo "${VERDE}CONFIGURAÇÃO DO MINICONDA CONCLUÍDA.${RESET}"
