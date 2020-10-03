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

# Desabilita os temas:
ZSH_THEME=""

# Carrega os plugins:
plugins=(autojump extract timer vi-mode zsh-autosuggestions)

source "${ZSH}/oh-my-zsh.sh" 2> /dev/null

# Carrega o plugin zsh-syntax-highlighting:
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
fi

# Configuração do plugin timer:
export TIMER_FORMAT="[%d]"
export TIMER_PRECISION=2

# Variável para evitar um comportamento estranho no vi-mode:
export KEYTIMEOUT=1

# Habilita cores:
autoload -U colors && colors

# Customiza o prompt:
export CONDA_ACTIVE=""
NOVALINHA=$'\n'
function zle-line-init zle-keymap-select {
    MODO="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"
    PROMPT="[%B%n%b@%B%m%b] [%B%D %T%b] [%B${MODO}%b]${NOVALINHA}[%B%~%b]${NOVALINHA}[%B%h%b]${CONDA_ACTIVE}> "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
PS2="> "

# Configuração do completamento automático:
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Comando para usar os recursos do conda:
[[ -f "${HOME}/.conda.zsh" ]] && source "${HOME}/.conda.zsh" 2> /dev/null

# Comando para usar os recursos do fzf:
[[ -f "${HOME}/.fzf.zsh" ]] && source "${HOME}/.fzf.zsh" 2> /dev/null

# Aliases que defini para o bash:
[[ -f "${HOME}/.bash_aliases" ]] && source "${HOME}/.bash_aliases" 2> /dev/null

# Aliases que defini para o zsh:
[[ -f "${HOME}/.zsh_aliases" ]] && source "${HOME}/.zsh_aliases" 2> /dev/null

ac-py
