#
#
#
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
#
#
#
# ___________________________________/\\\_____________________________________
#  __________________________________\/\\\_____________________________________
#   __________________________________\/\\\_____________________________________
#    ________/\\\\\\\\\\\__/\\\\\\\\\\_\/\\\__________/\\/\\\\\\\______/\\\\\\\\_
#     _______\///////\\\/__\/\\\//////__\/\\\\\\\\\\__\/\\\/////\\\___/\\\//////__
#      ____________/\\\/____\/\\\\\\\\\\_\/\\\/////\\\_\/\\\___\///___/\\\_________
#       __________/\\\/______\////////\\\_\/\\\___\/\\\_\/\\\_________\//\\\________
#        __/\\\__/\\\\\\\\\\\__/\\\\\\\\\\_\/\\\___\/\\\_\/\\\__________\///\\\\\\\\_
#         _\///__\///////////__\//////////__\///____\///__\///_____________\////////__
#
#
#
# Meu arquivo de configuração do zsh.

# CONFIGURAÇÃO RELACIONADA COM O OH-MY-ZSH.

# Diretório de instalação do oh-my-zsh:
export ZSH="${HOME}/.oh-my-zsh"

# Desabilita os temas:
ZSH_THEME=""

# Carrega os plugins:
plugins=(autojump extract git timer vi-mode zsh-autosuggestions)

source "${ZSH}/oh-my-zsh.sh"

# Habilita cores:
autoload -U colors && colors

# VARIÁVEIS DO AMBIENTE.

export PATH="$PATH:/usr/sbin"

# Comando para usar os programas instalados como pacotes snap:
[ -d /snap/bin ] && export PATH="${PATH}:/snap/bin"

# Comando para usar o trash-cli:
[ -d "${HOME}/.local/bin" ] && export PATH="${PATH}:${HOME}/.local/bin"

# Customiza o prompt:
CONDA_ACTIVE=""
NOVALINHA=$'\n'
function zle-line-init zle-keymap-select {
    MODO="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"
    PROMPT="[%B%n%b@%B%m%b] [%B%D %T%b] [%B${MODO}%b]${NOVALINHA}[%B%~%b]${NOVALINHA}[%B%h%b]${CONDA_ACTIVE}> "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
PS2="> "

# Variável para evitar um comportamento estranho no vi-mode:
export KEYTIMEOUT=1

# Define o meu editor padrão:
export VISUAL=nvim
export EDITOR="$VISUAL"

# Configuração do comando history:
export HISTSIZE=20000
export SAVEHIST=$HISTSIZE
export HISTFILE="${HOME}/.zsh_history"

# Configuração do plugin timer:
export TIMER_FORMAT="[%d]"
export TIMER_PRECISION=2

# CONDA.

[ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ] && source "${HOME}/miniconda3/etc/profile.d/conda.sh"
[ -f /opt/conda/etc/profile.d/conda.sh ] && source /opt/conda/etc/profile.d/conda.sh

# Ativa um dos meus ambientes do conda:
aconda () {
    conda activate "$1"
    CONDA_ACTIVE=" [%BCONDA --- $2 ($1)%b]"
}

# Desativa um ambiente do conda:
dconda () {
    conda deactivate
    CONDA_ACTIVE=""
}

# FZF.

# Comando para usar os recursos do fzf:
[ -f "${HOME}/.fzf.zsh" ] && source "${HOME}/.fzf.zsh"

# ALIASES.

# Aliases que defini para o Bash:
[ -f "${HOME}/.bash_aliases" ] && source "${HOME}/.bash_aliases"

# CONDA.

alias ac-c="aconda env2 C/C++"
alias ac-py="aconda env1 PYTHON"
alias dc="dconda"

# LSD.

alias l="lsd -l"
alias la="lsd -A"
alias lla="lsd -lA"
alias lt="lsd --tree"

# TRASH-CLI.

alias te="trash-empty"
alias tl="trash-list"
alias tp="trash-put"

# Configuração do completamento automático:
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Carrega o plugin zsh-syntax-highlighting:
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
