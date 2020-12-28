"Slasher Liang
"
" Sets how many lines of history VIM has to remember
set history=1000
let mapleader = ","
let g:mapleader = ","

" Height of the command bar
set cmdheight=2

" show line numbers
set number

" Show '>---' for tab and '-' for whitespace at the tail of line
set list
set listchars=tab:>-,trail:\-

if exists('+colorcolumn')
  set colorcolumn=80,100
  " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  " match OverLength /\%81v.\+/
  highlight ColorColumn ctermbg=black guibg=#00005f
endif

let g:systype=system('uname -s')

nnoremap <TAB> :tabnext <cr>


au FileType json set foldmethod=indent
autocmd FileType ansible set filetype=yaml


" YCM https://github.com/Valloric/YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'gitcommit': 1,
    \ 'nerdtree': 1,
    \ 'diff': 1,
    \ 'make': 1,
    \ 'vim': 1,
    \ 'sh': 1,
\}


" https://github.com/fatih/vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_test_show_name = 0
let g:go_test_timeout= '10s'
let g:go_updatetime = 2000
" disable auto fmt on save
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
let g:go_imports_mode = "goimports"
" let g:go_info_mode = "gocode"
" let g:go_def_mode = 'godef'
let g:go_info_mode = "gopls"
let g:go_def_mode = 'gopls'
let g:go_def_reuse_buffer = 1
let g:go_mod_fmt_autosave = 0
let g:go_gopls_analyses = v:true

au FileType go nmap \f :GoFmt<CR>
au FileType go nmap \r <Plug>(go-run)
au FileType go nmap \b <Plug>(go-build)
au FileType go nmap \t <Plug>(go-test)
au FileType go nmap \c <Plug>(go-coverage)

au FileType go nmap gr :GoRename<CR>
au FileType go nmap gd <Plug>(go-def-tab)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" rust
let g:rust_clip_command = 'pbcopy'
let g:cargo_shell_command_runner = '!'
let g:racer_cmd = "/Users/slasher/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

au FileType rust nmap \f :RustFmt<CR>
au FileType rust nmap \r :Crun<CR>
au FileType rust nmap \b :Cbuild<CR>
au FileType rust nmap \t :Ctest<CR>
au FileType rust nmap \c :Cclean<CR>

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap <Leader>gd <Plug>(rust-doc)

" https://github.com/luochen1990/rainbow
let g:rainbow_active = 0
let g:rainbow_conf = {
    \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \ 'operators': '_,_',
    \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \ 'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \ }
\}
nnoremap <leader>rr :RainbowToggle<CR>

let g:NERDTreeWinPos = "left"
let g:tagbar_left=1
nnoremap <leader>mm :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" Select tab page
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap gu gu
nnoremap <leader>gu gU

function! NextBufferNotInTabpage()
    let nextnum = -1

    let buflist = []
    for i in range(tabpagenr('$'))
       call extend(buflist, tabpagebuflist(i + 1))
    endfor

    let curbufnum = bufnr("%")

    let arr = range(1, bufnr("$"))
    let arr = arr[curbufnum-1:] + arr[:curbufnum-1]

    for i in arr
        if bufnr(i) == -1
            continue
        endif

        if index(buflist, i) == -1
            let nextnum = i
            break
        endif
    endfor

    if nextnum > 0
        execute ":buffer " . nextnum
    endif

endfunction

" Shift+Tab change buffer in window, ( <TAB> next tab page )
nnoremap <S-TAB> :call NextBufferNotInTabpage()<cr>

" Replace word under cursor in the file
nnoremap <leader>s :0,$s/\<<c-r><c-w>\>/<c-r><c-w>/g
