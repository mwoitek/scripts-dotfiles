DIRECTORY="/usr/sbin"
if [[ "${PATH}" != *"${DIRECTORY}"* ]]; then
    export PATH="${PATH}:${DIRECTORY}"
fi

DIRECTORY="${HOME}/.local/bin"
if [[ -d "${DIRECTORY}" && "${PATH}" != *"${DIRECTORY}"* ]]; then
    export PATH="${PATH}:${DIRECTORY}"
fi

# Comandos para usar os programas instalados como pacotes snap:
DIRECTORY="/snap/bin"
if [[ -d "${DIRECTORY}" && "${PATH}" != *"${DIRECTORY}"* ]]; then
    export PATH="${PATH}:${DIRECTORY}"
fi

# Diretório de instalação do oh-my-zsh:
export ZSH="${HOME}/.oh-my-zsh"

# Define o editor padrão:
export VISUAL=nvim
export EDITOR="${VISUAL}"

# Configuração do comando history:
export HISTSIZE=20000
export SAVEHIST="${HISTSIZE}"
export HISTFILE="${HOME}/.zsh_history"
