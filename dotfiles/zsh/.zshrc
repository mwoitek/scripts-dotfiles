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
plugins=(
    autojump
    colored-man-pages
    debian
    extract
    git
    timer
    vi-mode
    you-should-use
    zsh-autosuggestions
    zsh-interactive-cd
)

source "${ZSH}/oh-my-zsh.sh" 2> /dev/null

# Carrega o plugin zsh-syntax-highlighting:
ZSH_SYNTAX_HIGHLIGHTING="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f ${ZSH_SYNTAX_HIGHLIGHTING} ]] && source ${ZSH_SYNTAX_HIGHLIGHTING} 2> /dev/null

# Configuração do plugin timer:
export TIMER_FORMAT="[%d]"
export TIMER_PRECISION=2

# Variável para evitar um comportamento estranho no vi-mode:
export KEYTIMEOUT=1

# Comandos para adicionar atalhos como ci", ci', ci` e di":
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

# Comandos para adicionar atalhos como ci{, ci(, ci< e di{:
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

# Habilita cores:
autoload -U colors && colors

# Customiza o prompt:
export CONDA_ACTIVE=""
NOVALINHA=$'\n'
function zle-line-init zle-keymap-select {
    MODO="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"
    PROMPT="┌[%B%n%b@%B%m%b]${CONDA_ACTIVE} [%B${MODO}%b]${NOVALINHA}└[%B%~%b]${NOVALINHA}▶ "
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

# Atalhos do vim para navegar no menu do completamento automático:
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char

# Comando para usar os recursos do conda:
[[ -f "${HOME}/.conda.zsh" ]] && source "${HOME}/.conda.zsh" 2> /dev/null

# Comando para usar os recursos do fzf:
[[ -f "${HOME}/.fzf.zsh" ]] && source "${HOME}/.fzf.zsh" 2> /dev/null

# Aliases que defini para o zsh:
[[ -f "${HOME}/.zsh_aliases.zsh" ]] && source "${HOME}/.zsh_aliases.zsh" 2> /dev/null

ac-py
