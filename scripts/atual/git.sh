#!/bin/bash
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

# Array associativo que armazena os diretórios que contêm repositórios do git:
declare -gA REPOS
REPOS["fzf"]="${HOME}/.fzf"
# REPOS["neovim"]="${HOME}/neovim"
REPOS["nerd-fonts"]="${HOME}/.fonts/nerd-fonts"
REPOS["oh-my-zsh"]="${HOME}/.oh-my-zsh"
REPOS["trash-cli"]="${HOME}/trash-cli"

# Função para executar o comando "git pull" para um único diretório:
gitPull() {
    NOME="$1"
    DIRETORIO="$2"
    AZUL="$(tput setaf 4)"
    RESET="$(tput sgr0)"
    echo "Atualizando ${AZUL}${NOME}${RESET}..."
    if [[ -d "${DIRETORIO}" ]]; then
        # shellcheck disable=SC2164
        cd "${DIRETORIO}"
        git pull
    else
        echo "O diretório ${DIRETORIO} não existe."
    fi
    echo
}

# Função para executar o comando "git pull" para todos os diretórios:
gitPullAll() {
    for NOME in "${!REPOS[@]}"; do
        DIRETORIO="${REPOS[${NOME}]}"
        gitPull "${NOME}" "${DIRETORIO}"
    done
}

RESET="$(tput sgr0)"
VERDE="$(tput setaf 2)"
VERMELHO="$(tput setaf 1)"
echo -e "${VERMELHO}Atualizando o que instalei através do git...${RESET}\\n"
gitPullAll
echo "${VERDE}Diretórios atualizados.${RESET}"
