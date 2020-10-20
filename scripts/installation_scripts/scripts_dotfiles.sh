#!/bin/bash
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
# Script que baixa os meus scripts e arquivos de configuração e coloca todos
# esses arquivos nas pastas certas.

AZUL="$(tput setaf 4)"
RESET="$(tput sgr0)"
VERDE="$(tput setaf 2)"
VERMELHO="$(tput setaf 1)"

echo -e "${AZUL}LIDANDO COM OS MEUS SCRIPTS E ARQUIVOS DE CONFIGURAÇÃO...${RESET}\\n"

echo -e "${AZUL}Baixando os arquivos do meu repositório do git...${RESET}\\n"
# shellcheck disable=SC2164
cd
if [[ -d ./scripts-dotfiles ]]; then
    # shellcheck disable=SC2164
    cd ./scripts-dotfiles
    git pull
else
    git clone https://github.com/mwoitek/scripts-dotfiles
fi
echo -e "\\n${VERDE}Arquivos baixados.${RESET}\\n"

echo -e "${AZUL}Movendo os meus arquivos de configuração do zsh...${RESET}\\n"
# shellcheck disable=SC2164
cd
if [[ -d ./scripts-dotfiles/dotfiles/zsh ]]; then
    for FILE in ./scripts-dotfiles/dotfiles/zsh/.*; do
        if [[ -f "./${FILE##*/}" ]]; then
            mv "./${FILE##*/}" "./${FILE##*/}-backup"
        fi
        cp "${FILE}" .
    done
    echo -e "\\n${VERDE}Os meus arquivos de configuração do zsh estão nos seus devidos lugares.${RESET}\\n"
else
    echo -e "${VERMELHO}A pasta com os meus arquivos de configuração do zsh não foi encontrada.${RESET}\\n"
fi

echo -e "${AZUL}Movendo os meus scripts de atualização...${RESET}\\n"
# shellcheck disable=SC2164
cd
if [[ -d ./scripts-dotfiles/scripts/atual ]]; then
    if [[ -d ./atual ]]; then
        mv ./atual ./atual-backup
    fi
    cp -r ./scripts-dotfiles/scripts/atual .
    echo -e "\\n${VERDE}Os meus scripts de atualização estão nos seus devidos lugares.${RESET}\\n"
else
    echo -e "${VERMELHO}A pasta com os meus scripts de atualização não foi encontrada.${RESET}\\n"
fi

echo -e "${VERDE}OS MEUS SCRIPTS E ARQUIVOS DE CONFIGURAÇÃO ESTÃO NOS SEUS DEVIDOS LUGARES.${RESET}"
