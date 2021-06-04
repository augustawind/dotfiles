" [!] needed by other plugins
Plug 'xolox/vim-misc'

" session management
Plug 'tpope/vim-obsession'

" file explorer
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
autocmd! VimEnter * call defx#custom#option('_', {
            \ 'winwidth': 30,
            \ 'split': 'vertical',
            \ 'show_ignored_files': 0,
            \ 'buffer_name': 'defxplorer',
            \ 'toggle': 1,
            \ 'resume': 1
            \ })

" unify tabs and buffers
Plug 'ap/vim-buftabline'

" dash app support
Plug 'rizzatti/dash.vim'
nmap <Leader>D :Dash<CR>

" colorscheme switcher
Plug 'xolox/vim-colorscheme-switcher'
let g:colorscheme_switcher_keep_background = 0
let g:colorscheme_switcher_exclude_builtins = 1
let g:colorscheme_switcher_define_mappings = 0

" git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" repeat last command (enhanced for tpope)
Plug 'tpope/vim-repeat'

" surround things with other things
Plug 'tpope/vim-surround'

" s-expressions
Plug 'guns/vim-sexp'
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,fennel'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number -- '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" expand %% to current buffer dir
cabbr <expr> %% expand('%:p:h')

" source code browser
Plug 'majutsushi/tagbar'
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : '/Users/dtr/src/rst2ctags/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }

" indentation guides
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" async `make`
Plug 'neomake/neomake'

" splash page
Plug 'mhinz/vim-startify'

" 'aa', 'ia' motions (select inner argument)
" https://github.com/vim-scripts/argtextobj.vim
Plug 'vim-scripts/argtextobj.vim'
let g:argtextobj_pairs = "[:],{:},(:),<:>"

" 'ae', 'ie' motions (select entire document)
" https://github.com/kana/vim-textobj-entire
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" replace contents of register (clipboard)
" https://github.com/vim-scripts/ReplaceWithRegister
"
" [count]["x]gr{motion}   Replace {motion} text with the contents of register x.
"                         Especially when using the unnamed register, this is
"                         quicker than "_d{motion}P or "_c{motion}<C-R>"
" [count]["x]grr          Replace [count] lines with the contents of register x.
"                         To replace from the cursor position to the end of the
"                         line use ["x]gr$
" {Visual}["x]gr          Replace the selection with the contents of register x.
Plug 'vim-scripts/ReplaceWithRegister'

" semi-interactive text exchange operator
" https://github.com/tommcdo/vim-exchange
"
" `cx{motion}`  1st use, select text to exchange; 2nd use, perform exchange
" `cxx`         like `cx` but use current line
" `X`           like `cx` but for visual mode
" `cxc`         clear current motion
Plug 'tommcdo/vim-exchange'
