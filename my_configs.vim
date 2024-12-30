" Slasher Liang
"
" Sets how many lines of history VIM has to remember
set history=1000
let mapleader = ","
let g:mapleader = ","

" Height of the command bar
set cmdheight=2

" show line numbers
set number

" set t_Co=128   " This is may or may not needed.

" Show '>---' for tab and '-' for whitespace at the tail of line
set list
" set listchars=tab:>-,trail:\-
" set listchars=tab:→\ ,trail:.,precedes:«,extends:»,eol:$
set listchars=tab:→\ ,trail:.,precedes:«,extends:»

if exists('+colorcolumn')
  set colorcolumn=80,100,120
  " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  " match OverLength /\%81v.\+/
  highlight ColorColumn ctermbg=black guibg=#00005f
endif

" autocmd FileType c set noexpandtab
" autocmd FileType cpp set noexpandtab

" highlight (:hi)
" see more: https://yianwillis.github.io/vimcdoc/doc/syntax.html#:highlight
"           https://www.ditig.com/256-colors-cheat-sheet
"                                                          cterm-colors
"            NR-16   NR-8    颜色名
"            0       0       Black (黑)
"            1       4       DarkBlue (深蓝)
"            2       2       DarkGreen (深绿)
"            3       6       DarkCyan (深青)
"            4       1       DarkRed (深红)
"            5       5       DarkMagenta (深品红)
"            6       3       Brown，DarkYellow (褐、深黄)
"            7       7       LightGray、LightGrey，Gray，Grey (浅灰)
"            8       0*      DarkGray，DarkGrey (深灰)
"            9       4*      Blue，LightBlue (浅蓝)
"            10      2*      Green，LightGreen (浅绿security)
"            11      6*      Cyan，LightCyan (浅青)
"            12      1*      Red，LightRed (浅品红)
"            13      5*      Magenta，LightMagenta (浅红)
"            14      3*      Yellow，LightYellow (浅黄)
"            15      7*      White (白)
hi Normal ctermfg=254 ctermbg=0 guifg=#ffffff guibg=#333333
hi Comment term=bold ctermfg=DarkCyan ctermbg=0 guifg=#eeee00 guibg=#4d4d4d
hi Constant term=bold cterm=bold ctermfg=130 guifg=#ffa0a0
hi Type term=underline cterm=bold ctermfg=40 gui=bold guifg=#bdb76b
hi String term=bold ctermfg=DarkMagenta gui=bold guifg=indianred
hi Keyword term=standout cterm=bold ctermfg=118 gui=bold guifg=springgreen
hi Identifier term=underline ctermfg=DarkCyan guifg=#89fb98
hi Statement term=bold cterm=bold ctermfg=220 gui=bold guifg=#f0e68c
hi Function term=underline cterm=bold ctermfg=12 guifg=#89fb98
hi Exception term=standout cterm=bold ctermfg=1 guifg=salmon
hi Todo term=standout ctermfg=0 ctermbg=5 guifg=#ff0000 guibg=#eeee00
hi SpecialKey ctermfg=239 guifg=#9acd32
hi IncSearch term=reverse ctermfg=186 ctermbg=37 guifg=#f0e68c guibg=#cd853f
hi Search    term=reverse ctermfg=186 ctermbg=34 guifg=#f0e68c guibg=#7f7f8c
hi Pmenu           ctermfg=231 ctermbg=39 guifg=#ffffff guibg=#666666
hi PmenuSel        ctermfg=236 ctermbg=46 guifg=#333333 guibg=#f0e68c
hi PmenuSbar       ctermbg=236 guibg=#333333
hi PmenuThumb      ctermbg=144 guibg=#c2bfa5
hi diffRemoved ctermfg=LightRed guifg=#ff2222
hi goRawString term=bold cterm=bold ctermfg=200 gui=bold guifg=indianred
hi link goBuiltins Identifier
hi link goGenerate Keyword

let g:systype=system('uname -s')

nnoremap <TAB> :tabnext <cr>

" au FileType json set foldmethod=indent
autocmd FileType ansible set filetype=yaml

" coc.vim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> \d <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


" " YCM https://github.com/Valloric/YouCompleteMe
" let g:ycm_add_preview_to_completeopt = 0
" set completeopt-=preview
" let g:ycm_autoclose_preview_window_after_completion = 0
" let g:ycm_autoclose_preview_window_after_insertion = 0
" let g:ycm_gopls_binary_path = '/root/lib/go/bin/gopls'
" let g:ycm_gopls_args = ['-remote=auto']
" let g:ycm_filetype_specific_completion_to_disable = {
"     \ 'gitcommit': 1,
"     \ 'nerdtree': 1,
"     \ 'diff': 1,
"     \ 'make': 1,
"     \ 'vim': 1,
"     \ 'sh': 1,
" \}


" https://github.com/fatih/vim-go
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_test_show_name = 0
let g:go_test_timeout= '30s'
let g:go_auto_sameids = 0
let g:go_updatetime = 2000
" disable auto fmt on save
let g:go_fmt_autosave = 0
" let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gopls"
" let g:go_gopls_gofumpt = v:null
let g:go_gopls_gofumpt = 1
let g:go_imports_mode = "gopls"
let g:go_info_mode = "gopls"
let g:go_def_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_def_reuse_buffer = 1
let g:go_mod_fmt_autosave = 0
let g:go_gopls_analyses = {"gopls": v:true}
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ['deadcode', 'gosimple', 'govet', 'ineffassign', 'staticcheck', 'structcheck', 'typecheck', 'unused', 'varcheck', 'vet', 'revive']
let g:go_metalinter_deadline = "60s"
let g:go_gopls_options = ['-remote=auto']

au FileType go nmap \f :GoFmt<CR>
au FileType go nmap \l :GoMetaLinter<CR>
" au FileType go nmap \a :GoBuildTags ''<CR>
au FileType go nmap \a :GoInfo<CR>
au FileType go nmap \r <Plug>(go-run)
au FileType go nmap \b <Plug>(go-build)
au FileType go nmap \t <Plug>(go-test)
au FileType go nmap \c <Plug>(go-coverage)
" au FileType go nmap \c :GoCoverageToggle<CR>

au FileType go nmap gd <Plug>(go-def-tab)
au FileType go nmap \d :GoReferrers<CR>
au FileType go nmap gr :GoRename<CR>
au FileType go nmap I :GoImplements<CR>
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)


" https://github.com/rhysd/vim-clang-format
let g:clang_format#command = "clang-format"
let g:clang_format#git = "git"
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 0
" $ clang-format -dump-config
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AlignOperands" : "Align",
            \ "AllowShortBlocksOnASingleLine" : "Empty",
            \ "AllowShortCaseLabelsOnASingleLine" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "Inline",
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "ColumnLimit" : 120,
            \ "TabWidth" : 4,
            \ "Standard" : "c++17"}

" map to \f in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer>\f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer>\f :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc nnoremap <buffer>\f <Plug>(operator-clang-format)
" Toggle auto formatting:
autocmd FileType c,cpp,objc nnoremap <Leader>C :ClangFormatAutoToggle<CR>


" rust
let g:rust_clip_command = 'pbcopy'
let g:cargo_shell_command_runner = '!'
let g:racer_cmd = "/root/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

au FileType rust nmap \f :RustFmt<CR>
au FileType rust nmap \r :Crun<CR>
au FileType rust nmap \b :Cbuild<CR>
au FileType rust nmap \t :Ctest<CR>
au FileType rust nmap \c :Cclean<CR>

" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap <Leader>gd <Plug>(rust-doc)


" python
" au FileType python nmap gt :YcmCompleter GoTo<CR>
" au FileType python nmap gd :YcmCompleter GoToDefinition<CR>

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

xnoremap \\ <Plug>Commentary
nnoremap \\ <Plug>Commentary
onoremap \\ <Plug>Commentary

" Select tab page
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap gu gu
nnoremap <leader>gu gU

" https://github.com/vim-airline/vim-airline
" status and tab bar
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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
" Insert // at first of every line in the file
nnoremap <leader>a ::%s!^!//!
" Insert $$ at end of line in the file
nnoremap <leader>aa ::%s/$/$$/

" Replace regex under visual mode
vnoremap <leader>s :s/\v(.*)/\1/gc
" Insert // at first of selected line under visual mode
vnoremap <leader>a :s!^!//!
" Insert $$ at end of selected line under visual mode
vnoremap <leader>aa :s/$/$$/

" Grep word under cursor in directory
nnoremap !s :! grep <c-r><c-w> *

nnoremap <silent> <leader>ll :set wrap! <cr>

" Move left 1/2 a screen, replace `Scroll up one line`
nnoremap <silent> <c-e> :execute "normal! " . (winwidth(0)/2) . "l"<CR>
" Move right 1/2 a screen, replace `Scroll down one line`
nnoremap <silent> <c-y> :execute "normal! " . (winwidth(0)/2) . "h"<CR>
