"
"
"
" ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
" ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
" ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
" ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
" ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
"  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
"
"
"
"            $$\
"            \__|
" $$\    $$\ $$\ $$$$$$\$$$$\   $$$$$$\   $$$$$$$\
" \$$\  $$  |$$ |$$  _$$  _$$\ $$  __$$\ $$  _____|
"  \$$\$$  / $$ |$$ / $$ / $$ |$$ |  \__|$$ /
"   \$$$  /  $$ |$$ | $$ | $$ |$$ |      $$ |
" $$\\$  /   $$ |$$ | $$ | $$ |$$ |      \$$$$$$$\
" \__|\_/    \__|\__| \__| \__|\__|       \_______|
"
"
"
" Meu arquivo de configuração do vim.

set nocompatible

" Roda o gerenciador de plugins Pathogen:
execute pathogen#infect()

" Habilita o destaque de sintaxe:
syntax on
filetype plugin on

" Mostra o número da linha atual
" e a posição relativa das outras linhas:
:set number
:set relativenumber

" Mostra os comandos parciais
" na parte de baixo da tela:
:set showcmd

" Destaca o texto quando realizo uma busca:
:set hlsearch
:set incsearch

" Minhas configurações de indentação:
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

" Quando a tecla F3 é pressionada,
" desabilita temporariamente
" o destaque do texto buscado:
nnoremap <F3> :noh<CR>

" Quando a tecla F5 é pressionada,
" remove espaços desnecessários
" nos finais das linhas:
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Quando um arquivo é salvo,
" remove espaços desnecessários
" nos finais das linhas:
autocmd BufWritePre * %s/\s\+$//e

" No modo de inserção,
" faz ii funcionar como a tecla ESC:
:imap ii <Esc>

" Configurações do plugin lightline:
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }
