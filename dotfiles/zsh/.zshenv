# Adiciona alguns diretórios à variável PATH
function addToPath() {
    DIRECTORY="$1"
    if [[ -d "${DIRECTORY}" && "${PATH}" != *"${DIRECTORY}"* ]]; then
        export PATH="${PATH}:${DIRECTORY}"
    fi
}
export GOPATH="${HOME}/go"
addToPath "${GOPATH}/bin"
addToPath "${HOME}/.emacs.d/bin"
addToPath "${HOME}/.gem/ruby/2.7.0/bin"
addToPath "${HOME}/.local/bin"
addToPath "/usr/sbin"

# Diretório de instalação do oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"

# Define o editor padrão
export VISUAL="nvim"
export EDITOR="${VISUAL}"

# Define o navegador padrão
export BROWSER="librewolf"

# Configuração do fzf
export FZF_COMPLETION_TRIGGER=",,"

# Configuração do comando history
export HISTSIZE=20000
export SAVEHIST="${HISTSIZE}"
export HISTFILE="${HOME}/.zsh_history"
