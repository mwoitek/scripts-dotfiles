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

" Usa o vim-plug para carregar os plugins:
call plug#begin('$HOME/.vim/bundle/')
" Plug 'chrisbra/colorizer'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf'
Plug 'itchyny/lightline.vim'
Plug 'unblevable/quick-scope'
" Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'jvirtanen/vim-octave'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
call plug#end()

" Configuração do lightline:
set laststatus=2
set noshowmode
let g:lightline={'colorscheme': 'seoul256'}

" Habilita o destaque de sintaxe:
syntax on
filetype plugin on

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
set shiftwidth=2
set softtabstop=2
set autoindent

" Destaca a linha e a coluna atuais:
set cursorline
" set cursorcolumn
highlight CursorLine cterm=bold
" highlight CursorColumn ctermbg=234 cterm=bold

" Dá acesso à área de transferência:
set clipboard+=unnamedplus

" Quando um arquivo é salvo, remove espaços desnecessários nos finais das linhas:
autocmd BufWritePre * %s/\s\+$//e

" Quando entro no modo de inserção, centraliza a tela verticalmente:
autocmd InsertEnter * norm zz

" ATALHOS DE TECLADO.

" Usa a vírgula como a tecla líder:
let mapleader=","

" No modo de inserção, faz ii funcionar como a tecla ESC:
inoremap ii <Esc>

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

" ATALHOS PARA INTERAGIR COM A ÁREA DE TRANSFERÊNCIA.

" <leader>+c --- Copia:
vnoremap <leader>c "+y

" <leader>+d --- Corta:
vnoremap <leader>d "+d

" <leader>+v --- Cola:
inoremap <leader>v <ESC>"+pa

" ATALHOS PARA HABILITAR O CORRETOR ORTOGRÁFICO.

" <leader>+e --- Habilita a ferramenta para corrigir um texto em INGLÊS:
nnoremap <leader>e :setlocal spell! spelllang=en_us<CR>

" <leader>+p --- Habilita a ferramenta para corrigir um texto em PORTUGUÊS:
nnoremap <leader>p :setlocal spell! spelllang=pt_br<CR>
