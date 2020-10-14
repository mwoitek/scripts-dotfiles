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

" Configuração básica:
set nocompatible
set encoding=utf-8
set termguicolors

" Especifica a localização do binário do Python:
" let g:python3_host_prog='/home/woitek/.conda/envs/env1/bin/python3'
let g:python3_host_prog='/home/woitek/miniconda3/envs/env1/bin/python3'

" Usa o vim-plug para carregar os plugins:
call plug#begin('$HOME/.vim/bundle/')
" Plug 'jvirtanen/vim-octave'
" Plug 'lervag/vimtex'
" Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'szymonmaszke/vimpyter'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
call plug#end()

" Define o esquema de cores:
colorscheme molokai

" Configuração do CoC:

" Especifica a localização do binário do clangd:
if filereadable('/usr/bin/clangd-11')
    call coc#config('clangd.path', '/usr/bin/clangd-11')
endif

" Especifica a localização do binário do phpactor:
if filereadable('$HOME/.vim/bundle/phpactor/bin/phpactor')
    call coc#config('phpactor.path', '$HOME/.vim/bundle/phpactor/bin/phpactor')
endif

" Configuração do lightline:
set laststatus=2
set noshowmode
let g:lightline={'colorscheme': 'seoul256'}

" Ativa o vim-rainbow:
let g:rainbow_active=1

" Configuração do vimtex:
" let g:tex_flavor='latex'
" let g:vimtex_compiler_progname='/home/woitek/.conda/envs/env1/bin/nvr'
" let g:vimtex_indent_enabled=0
" let g:vimtex_indent_ignored_envs=['align', 'align*', 'block', 'document',
"                                 \ 'equation', 'equation*', 'figure', 'frame', 'itemize']
" let g:vimtex_indent_on_ampersands=0
" let g:vimtex_quickfix_autoclose_after_keystrokes=1
" let g:vimtex_view_method='zathura'

" Habilita o destaque de sintaxe:
syntax on
filetype indent plugin on
autocmd BufNewFile,BufRead *.m set syntax=octave

" Mostra o número da linha atual e a posição relativa das outras linhas:
set number
set relativenumber

" Mostra os comandos parciais na parte de baixo da tela:
set showcmd

" Destaca o texto quando realizo uma busca:
set hlsearch
set incsearch

" Configuração de completamento automático na linha de comando:
set wildmenu
set wildmode=longest:full,full

" Configuração de indentação:
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4

" Destaca a linha atual:
set cursorline
highlight CursorLine cterm=bold

" Dá acesso à área de transferência:
set clipboard+=unnamedplus

" Quando um arquivo é salvo, remove espaços desnecessários nos finais das
" linhas e linhas vazias no fim do arquivo:
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Quando entro no modo de inserção, centraliza a tela verticalmente:
autocmd InsertEnter * norm zz

" ATALHOS DE TECLADO.

" Usa a vírgula como a tecla líder:
let mapleader=','

" <leader>+h --- Desabilita temporariamente o destaque do texto buscado:
nnoremap <leader>h :noh<CR>

" <leader>+t --- Remove espaços desnecessários nos finais das linhas:
nnoremap <leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" <leader>+q --- Fecha o vim:
nnoremap <leader>q :q<CR>

" <leader>+s --- Busca e substitui no arquivo inteiro:
nnoremap <leader>s :%s///gc<Left><Left><Left><Left>

" <leader>+w --- Salva o arquivo:
nnoremap <leader>w :w<CR>

" <leader>+z --- Salva o arquivo e fecha o vim:
nnoremap <leader>z :wq<CR>

" :w! --- Salva o arquivo quando a permissão de root é necessária:
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!

" ATALHOS PARA HABILITAR O CORRETOR ORTOGRÁFICO.

" <leader>+e --- Habilita a ferramenta para corrigir um texto em INGLÊS:
nnoremap <leader>e :setlocal spell! spelllang=en_us<CR>

" <leader>+p --- Habilita a ferramenta para corrigir um texto em PORTUGUÊS:
nnoremap <leader>p :setlocal spell! spelllang=pt_br<CR>

" ATALHOS PARA NAVEGAR NO ARQUIVO.

nnoremap ga H
nnoremap gb L
nnoremap gl $
vnoremap gl $<Left>

" ATALHOS PARA PASSAR DE UMA SPLIT PARA OUTRA.

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l