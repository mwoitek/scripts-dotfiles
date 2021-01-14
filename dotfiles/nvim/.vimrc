" ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
" ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
" ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
" ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
" ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
"  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
"
"            $$\
"            \__|
" $$\    $$\ $$\ $$$$$$\$$$$\   $$$$$$\   $$$$$$$\
" \$$\  $$  |$$ |$$  _$$  _$$\ $$  __$$\ $$  _____|
"  \$$\$$  / $$ |$$ / $$ / $$ |$$ |  \__|$$ /
"   \$$$  /  $$ |$$ | $$ | $$ |$$ |      $$ |
" $$\\$  /   $$ |$$ | $$ | $$ |$$ |      \$$$$$$$\
" \__|\_/    \__|\__| \__| \__|\__|       \_______|

" Configuração básica:
set nocompatible
set encoding=utf-8
set termguicolors

" Especifica a localização do binário do Python:
let g:python3_host_prog='/home/woitek/miniconda3/envs/env1/bin/python3'

" Usa o vim-plug para carregar os plugins:
call plug#begin('$HOME/.vim/bundle/')
Plug 'Raimondi/delimitMate'
if !has('nvim')
    Plug 'easymotion/vim-easymotion'
endif
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jvirtanen/vim-octave'
Plug 'lervag/vimtex'
if has('nvim')
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
endif
Plug 'sheerun/vim-polyglot'
Plug 'svermeulen/vim-subversive'
Plug 'szymonmaszke/vimpyter'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'yggdroot/indentline'
call plug#end()

" Define o esquema de cores:
colorscheme molokai

" Configuração do CoC:
if has('nvim')
    " Especifica a localização do binário do clangd:
    if filereadable('/usr/bin/clangd-11')
        call coc#config('clangd.path', '/usr/bin/clangd-11')
    endif
    " Especifica a localização do binário do npm:
    if filereadable('/usr/bin/npm')
        call coc#config('tsserver.npm', '/usr/bin/npm')
    endif
endif

" Configuração do lightline:
set laststatus=2
set noshowmode
if !has('nvim')
    let g:lightline={'colorscheme': 'molokai'}
else
    let g:lightline={
\       'colorscheme': 'molokai',
\       'active': {
\           'left': [ [ 'mode', 'paste' ],
\                     [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\       },
\       'component_function': {
\           'cocstatus': 'coc#status'
\       }
\   }
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
endif

" Configuração do vimtex:
let g:tex_flavor='latex'
let g:vimtex_compiler_progname='/home/woitek/miniconda3/envs/env1/bin/nvr'
let g:vimtex_indent_enabled=0
let g:vimtex_indent_ignored_envs=['align', 'align*', 'block', 'document',
                                \ 'equation', 'equation*', 'figure', 'frame', 'itemize']
let g:vimtex_indent_on_ampersands=0
let g:vimtex_quickfix_autoclose_after_keystrokes=1
let g:vimtex_view_method='zathura'

" Habilita o destaque de sintaxe:
syntax on
autocmd BufNewFile,BufRead *.m set syntax=octave

" Mostra o número da linha atual e a posição relativa das outras linhas:
set number
set relativenumber

" Mostra os comandos parciais na parte de baixo da tela:
set showcmd

" Configurações de busca:
set hlsearch
set ignorecase
set incsearch
set smartcase

" Configuração de completamento automático na linha de comando:
set wildmenu
set wildmode=longest:full,full

" Configuração de indentação:
filetype indent plugin on
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
autocmd FileType r setlocal shiftwidth=2 softtabstop=2
autocmd FileType rmarkdown setlocal shiftwidth=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 softtabstop=2

" Destaca a linha atual:
set cursorline

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

" <leader>+c --- Destaca a coluna 80:
nnoremap <silent> <leader>c :execute 'set cc=' . (&cc == '' ? '80' : '')<CR>

" <leader>+h --- Desabilita temporariamente o destaque do texto buscado:
nnoremap <silent> <leader>h :noh<CR>

" <leader>+o --- Desativa e depois ativa o destaque de sintaxe.
" Isso é útil, pois tem situações em que o destaque de sintaxe não é ativado
" corretamente de maneira automática. O atalho abaixo resolve esse problema.
nnoremap <silent> <leader>o :syntax off<CR>:syntax on<CR>

" <leader>+t --- Remove espaços desnecessários nos finais das linhas:
nnoremap <silent> <leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" <leader>+q --- Fecha o vim, a aba ou a split:
nnoremap <silent> <leader>q :q<CR>

" <leader>+s --- Busca e substitui no arquivo inteiro:
nnoremap <leader>s :%s///gc<Left><Left><Left><Left>

" <leader>+w --- Salva o arquivo:
nnoremap <leader>w :w<CR>

" <leader>+z --- Salva o arquivo e fecha:
nnoremap <leader>z :wq<CR>

" :w! --- Salva o arquivo quando a permissão de root é necessária:
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <Bar> edit!

" ATALHOS PARA HABILITAR O CORRETOR ORTOGRÁFICO.

" <leader>+e --- Habilita a ferramenta para corrigir um texto em INGLÊS:
nnoremap <silent> <leader>e :setlocal spell! spelllang=en_us<CR>

" <leader>+p --- Habilita a ferramenta para corrigir um texto em PORTUGUÊS:
nnoremap <silent> <leader>p :setlocal spell! spelllang=pt_br<CR>

" ATALHOS PARA NAVEGAR NO ARQUIVO.

nnoremap ga H
nnoremap gb L
nnoremap gl $
vnoremap ga H
vnoremap gb L
vnoremap gl $<Left>

" ATALHOS PARA USAR SPLITS.

nnoremap <Space>wh <C-w>h
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>wl <C-w>l
nnoremap <silent> <Space>ws :split<CR>

" ATALHOS PARA USAR OS RECURSOS DO FZF.

nnoremap <leader><leader>f :Files<Space>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>r :Files ~/repos<CR>

" ATALHOS PARA USAR OS RECURSOS DO VIM-SUBVERSIVE.

nmap S <Plug>(SubversiveSubstituteToEndOfLine)
nmap s <Plug>(SubversiveSubstitute)
nmap ss <Plug>(SubversiveSubstituteLine)
