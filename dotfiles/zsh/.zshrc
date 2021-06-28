# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

# Se não estiver rodando interativamente, não faça nada:
[[ $- != *i* ]] && return

# CONFIGURAÇÃO RELACIONADA COM O OH-MY-ZSH.

# Desabilita os temas:
ZSH_THEME=""

# Carrega os plugins:
plugins=(
    archlinux
    colored-man-pages
    debian
    extract
    git
    # timer
    you-should-use
    zsh-autosuggestions
    zsh-interactive-cd
)

source "${ZSH}/oh-my-zsh.sh" 2> /dev/null

# Configuração do plugin timer:
# export TIMER_FORMAT="[%d]"
# export TIMER_PRECISION=2

# Habilita o vi-mode:
bindkey -v
export KEYTIMEOUT=1

# Use 'v' para editar a linha de comando com o $EDITOR:
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Muda o formato do cursor dependendo do modo do vi:
function zle-keymap-select {
    case $KEYMAP in
        vicmd)      echo -ne "\e[1 q";;
        main|viins) echo -ne "\e[5 q";;
    esac
}
zle -N zle-keymap-select
function zle-line-init {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init

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
NOVALINHA=$'\n'
PROMPT="[%B%~%b]${NOVALINHA}-> "
PS2="-> "

# Configuração do completamento automático:
zstyle ":completion:*" menu select
zmodload zsh/complist
_comp_options+=(globdots)

# Atalhos do vim para navegar no menu do completamento automático:
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char

# Carrega o plugin autojump:
AUTOJUMP="${HOME}/.autojump/etc/profile.d/autojump.sh"
[[ -f "${AUTOJUMP}" ]] && source "${AUTOJUMP}" 2> /dev/null
autoload -U compinit && compinit -u

# Comando para usar os recursos do conda:
[[ -f "${HOME}/.conda.zsh" ]] && source "${HOME}/.conda.zsh" 2> /dev/null

# Comando para usar os recursos do fzf:
[[ -f "${HOME}/.fzf.zsh" ]] && source "${HOME}/.fzf.zsh" 2> /dev/null

# Aliases que defini para o zsh:
[[ -f "${HOME}/.zsh_aliases.zsh" ]] && source "${HOME}/.zsh_aliases.zsh" 2> /dev/null

# Carrega o plugin zsh-syntax-highlighting:
ZSH_SYNTAX_HIGHLIGHTING="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "${ZSH_SYNTAX_HIGHLIGHTING}" ]] && source "${ZSH_SYNTAX_HIGHLIGHTING}" 2> /dev/null
ZSH_SYNTAX_HIGHLIGHTING="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "${ZSH_SYNTAX_HIGHLIGHTING}" ]] && source "${ZSH_SYNTAX_HIGHLIGHTING}" 2> /dev/null

# Ativa o ambiente do Python (conda):
conda activate env1
