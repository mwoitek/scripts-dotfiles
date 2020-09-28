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
set t_Co=256

" Especifica a localização do binário do Python:
let g:python3_host_prog='/home/woitek/.conda/envs/env1/bin/python3'
" let g:python3_host_prog='/home/woitek/miniconda3/envs/env1/bin/python3'

" Usa o vim-plug para carregar os plugins:
call plug#begin('$HOME/.vim/bundle/')
" Plug 'jvirtanen/vim-octave'
" Plug 'lervag/vimtex'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'szymonmaszke/vimpyter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

colorscheme molokai_dark

" Ativa o deoplete:
let g:deoplete#enable_at_startup=1

" Configuração do lightline:
set laststatus=2
set noshowmode
let g:lightline={'colorscheme': 'seoul256'}

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
filetype plugin on
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
set noautoindent
set shiftwidth=4
set softtabstop=4

" Destaca a linha atual:
set cursorline
highlight CursorLine cterm=bold

" Dá acesso à área de transferência:
set clipboard+=unnamedplus

" Quando um arquivo é salvo, remove espaços desnecessários nos finais das linhas:
autocmd BufWritePre * %s/\s\+$//e

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

" ATALHOS PARA HABILITAR O CORRETOR ORTOGRÁFICO.

" <leader>+e --- Habilita a ferramenta para corrigir um texto em INGLÊS:
nnoremap <leader>e :setlocal spell! spelllang=en_us<CR>

" <leader>+p --- Habilita a ferramenta para corrigir um texto em PORTUGUÊS:
nnoremap <leader>p :setlocal spell! spelllang=pt_br<CR>
