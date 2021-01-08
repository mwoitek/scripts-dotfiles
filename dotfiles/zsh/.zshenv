function addToPath() {
    DIRECTORY="$1"
    if [[ -d "${DIRECTORY}" && "${PATH}" != *"${DIRECTORY}"* ]]; then
        export PATH="${PATH}:${DIRECTORY}"
    fi
}

addToPath "${HOME}/.local/bin"
addToPath "/usr/sbin"

# Diretório de instalação do oh-my-zsh:
export ZSH="${HOME}/.oh-my-zsh"

# Define o editor padrão:
export VISUAL="nvim"
export EDITOR="${VISUAL}"

# Define o navegador padrão:
export BROWSER="brave"

# Configuração do comando history:
export HISTSIZE=20000
export SAVEHIST="${HISTSIZE}"
export HISTFILE="${HOME}/.zsh_history"
