" ~/.vimrc
" Dustin Rohde

" ================================================
" Vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ------------------------------------------------
" general

Plugin 'tpope/vim-sensible'
Plugin 'xolox/vim-misc'
Plugin 'Shougo/vimproc.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.ropeproject$', '\.o', '\.hi']

Plugin 'kien/ctrlp.vim'
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

Plugin 'xolox/vim-session'
let g:session_autosave = 'yes'

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=0

Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au BufEnter,BufRead * RainbowParenthesesToggle
au BufEnter,BufRead * RainbowParenthesesLoadRound
au BufEnter,BufRead * RainbowParenthesesLoadSquare
au BufEnter,BufRead * RainbowParenthesesLoadBraces

" ------------------------------------------------
" linting

Plugin 'scrooloose/syntastic'
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ------------------------------------------------
" autocomplete

Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#auto_complete_delay = 0
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
      imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif

" ------------------------------------------------
" haskell

Plugin 'nbouscal/vim-stylish-haskell'

Plugin 'godlygeek/tabular'
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>
 
Plugin 'eagletmt/neco-ghc'
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

Plugin 'eagletmt/ghcmod-vim'
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
map <silent> tc :GhcModCheckAsync<CR>

" ------------------------------------------------
" javascript

Plugin 'raichoo/purescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jwhitley/vim-literate-coffeescript'
Plugin 'noc7c9/vim-iced-coffee-script'
Plugin 'othree/yajs.vim'
Plugin 'moll/vim-node'
Plugin 'ternjs/tern_for_vim'
Plugin 'elzr/vim-json'

let g:tern#command = [
            \ "/Users/dtr/.nvm/versions/node/v4.4.7/bin/node",
            \ "/Users/dtr/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime/node_modules/tern/bin/tern"
            \ ]
let g:neocomplete#sources#omni#functions.javascript = [
            \ 'tern#Complete',
            \ ]

" ------------------------------------------------
" elm

Plugin 'elmcast/elm-vim'

let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
au BufEnter,BufRead *.elm call neocomplete#util#set_default_dictionary(
    \ 'g:neocomplete#sources#omni#input_patterns',
    \ 'elm',
    \ '\.' )

" ------------------------------------------------
" python

Plugin 'vim-scripts/indentpython.vim'
let python_highlight_all=1

" ------------------------------------------------
" colorschemes

Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'endel/vim-github-colorscheme'
Plugin 'jnurmine/Zenburn'

" ------------------------------------------------

call vundle#end()
filetype plugin indent on

" ================================================

" ------------------------------------------------
" general

syntax on           " syntax highlighting
autocmd FileType qf wincmd J    " always move quickfix window to very bottom

set t_Co=256        " 256-color mode
set history=25      " keep n lines of command-line history
set spelllang=en_us " US English
set fileformat=unix " UNIX standard file format
set nobackup        " disable backup files (filename~)
set splitright      " new windows spawn to the right of current window
set encoding=utf-8  " UTF-8 encoding for new files
set backspace=2     " full backspace capability
set clipboard=unnamed,unnamedplus,autoselect
set cmdheight=1
set mouse=a

set number          " show line numbers
set colorcolumn=100 " max line length marker
set autochdir       " auto cd to current file directory
set nohlsearch      " don't highlight search results
set incsearch       " incremental search
set smartcase       " uppercase characters cause case-sensitive search
set laststatus=2    " always show statusline
set ruler           " show line/column number in statusline
set textwidth=100
set foldlevel=99
set foldmethod=indent
set splitbelow      " split new window below current window by default

set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

" ------------------------------------------------
" whitespace

set smarttab
set smartindent
set expandtab       " expand tabs to spaces
set autoindent      " auto-indent to current indent level on line break
set tabstop=4       " tabs are always 4 spaces wide
set softtabstop=4   " tab indents n columns; somehow > tabstop (look into this)
set shiftwidth=4    " auto-indent n columns

au BufNewFile,BufRead *.html,*.jade,*.pug,*.md,*.markdown,*.stylus,*.json,*.yml,*.yaml,*.hs,*.lhs,*.clj,*.elm
            \ call SetTabsTo(2)

function! SetTabsTo(n)
    execute "set tabstop=".a:n
    execute "set shiftwidth=".a:n
    execute "set softtabstop=".a:n
endfunction

au BufNewFile,BufRead *.md,*.markdown
            \ set textwidth=79

" ------------------------------------------------
" aesthetics

if has('gui_running')
    set background=dark
    colorscheme solarized
    set guifont=Monaco:h14
else
    set background=dark
    colorscheme gruvbox
endif

" ------------------------------------------------
" error bell

set noerrorbells
set novisualbell
set visualbell t_vb=
autocmd! GuiEnter * set visualbell t_vb=

" ------------------------------------------------
" keymaps

" sane vim splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" reload .vimrc
nnoremap sv :source $MYVIMRC<CR>

" fold/unfold with space
nnoremap <space> za

" ------------------------------------------------
" haskell module headers

let s:width = 72
function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "--  " . name . "\n"
    \       . "\n"
endfunction
nmap <silent> --s "=HaskellModuleSection()<CR>gp
