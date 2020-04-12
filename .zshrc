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
plugins=(autojump git timer vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Habilita cores:
autoload -U colors && colors

# Carrega o plugin zsh-syntax-highlighting:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# VARIÁVEIS DO AMBIENTE.

# Customiza o prompt:
CONDA_ACTIVE=""
NOVALINHA=$'\n'
function zle-line-init zle-keymap-select {
    MODO="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERÇÃO}"
    PROMPT="[%B%F{white}%n%f%b@%B%F{white}%m%f%b] [%B%F{white}%D %T%f%b] [%B%F{white}${MODO}%f%b]${NOVALINHA}[%B%F{white}%~%f%b]${NOVALINHA}[%B%F{white}%h%f%b]${CONDA_ACTIVE}> "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
PS2="> "

# Variável para evitar um comportamento estranho no vi-mode:
export KEYTIMEOUT=1

# Configuração do comando history:
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE="${HOME}/.zsh_history"

# Configuração do plugin timer:
export TIMER_FORMAT="[%d]"
export TIMER_PRECISION=3

# CONDA.

[ -f /opt/conda/etc/profile.d/conda.sh ] && source /opt/conda/etc/profile.d/conda.sh

# Ativa o meu ambiente do conda:
aconda () {
    conda activate env1
    CONDA_ACTIVE=" %F{green}[%BCONDA%b]%f"
}

# Desativa o meu ambiente do conda:
dconda () {
    conda deactivate
    CONDA_ACTIVE=""
}

# ALIASES.

alias ac="aconda"
alias dc="dconda"

# Aliases que defini para o Bash:
[ -f "${HOME}/.bash_aliases" ] && source "${HOME}/.bash_aliases"

# Configuração do completamento automático:
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Quando a combinação Ctrl-O é pressionada, usa o lf para mudar de diretório:
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s "^o" "lfcd\n"
