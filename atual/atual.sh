#!/bin/bash
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
# Meu script de atualização para os meus computadores que rodam o Debian.

# Define um array que armazena os nomes dos scripts de atualização:
declare -ga SCRIPTS
SCRIPTS_DIR=$(dirname "$0")
SCRIPTS=(
    "${SCRIPTS_DIR}/debian.sh"
    "${SCRIPTS_DIR}/git.sh"
    "${SCRIPTS_DIR}/neovim.sh"
)

# Função para rodar um script somente quando o arquivo correspondente existe:
safeRun() {
    ARQUIVO="$1"
    if [[ -f "${ARQUIVO}" ]]; then
        bash "${ARQUIVO}"
    fi
}

# Função para rodar todos os scripts de atualização:
safeRunAll() {
    for SCRIPT in "${SCRIPTS[@]}"; do
        safeRun "${SCRIPT}"
        echo
    done
}

RESET="$(tput sgr0)"
VERDE="$(tput setaf 2)"
VERMELHO="$(tput setaf 1)"
echo -e "${VERMELHO}RODANDO O MEU SCRIPT DE ATUALIZAÇÃO...${RESET}\\n"
safeRunAll
echo "${VERDE}ATUALIZAÇÃO CONCLUÍDA.${RESET}"
