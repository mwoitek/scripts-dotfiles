# Path to oh-my-zsh installation:
export ZSH="/home/woitek/.oh-my-zsh"

ZSH_THEME=""

# Standard plugins: ~/.oh-my-zsh/plugins/*
# Custom plugins: ~/.oh-my-zsh/custom/plugins/
plugins=(
        autojump
        git
        timer
        vi-mode
        zsh-autosuggestions
        )

source $ZSH/oh-my-zsh.sh

neofetch

# Enable colors and change prompt:
autoload -U colors && colors
PROMPT=$'%{$fg[red]%}┌[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[red]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[red]%}]
%{$fg[red]%}└[%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[red]%}]
>%{$reset_color%} '
PS2=$' %{$fg[red]%}|>%{$reset_color%} '

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode:
bindkey -v
export KEYTIMEOUT=1
bindkey -v '^?' backward-delete-char

# Use lf to switch directories and bind it to Ctrl-O:
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# Load zsh-syntax-highlighting:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
