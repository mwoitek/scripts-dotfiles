" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn. Otherwise, it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use <TAB> to trigger completion.
inoremap <silent><expr> <TAB>
\   pumvisible() ? "\<C-n>" :
\   <SID>check_back_space() ? "\<TAB>" :
\   coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <C-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <C-space> coc#refresh()
else
    inoremap <silent><expr> <C-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter.
inoremap <silent><expr> <CR>
\   pumvisible() ? coc#_select_confirm()
\   : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Format selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply codeAction to the selected region.
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Map functions and class text objects.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selection ranges.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command for formatting current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command for folding current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organizing imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CocList.
" Show all diagnostics.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<CR>
" Show commands.
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<CR>
" Manage extensions.
nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<CR>
" Do default action for next item.
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<CR>
" Resume latest CocList.
nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<CR>
" Open yank list.
nnoremap <silent><nowait> <space>y :<C-u>CocList -A --normal yank<CR>
