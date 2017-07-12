" ~/.vimrc
" Dustin Rohde

" ------------------------------------------------
" init

call plug#begin()

Plug 'tpope/vim-sensible'

for f in glob('~/.vim/vimrc.d/*.vim', 0, 1)
  execute 'source' f
endfor

call plug#end()

" ------------------------------------------------
" settings

set nocompatible
filetype plugin indent on
syntax on
autocmd FileType qf wincmd J    " move quickfix to bottom

set t_Co=256        " 256-color mode
set encoding=utf-8  " UTF-8 encoding for new files
set spelllang=en_us " US English
set fileformat=unix " UNIX standard file format
set nobackup        " disable backup files (filename~)
set hidden          " keep abandoned buffers loaded

set backspace=2     " full backspace capability
set mouse=a         " enable mouse
set clipboard=unnamed,unnamedplus,autoselect

set history=25      " keep n lines of command-line history
set cmdheight=2     " lines to use for cmdline

set colorcolumn=80      " max line length marker
set laststatus=2        " always show statusline
set ruler               " show line/column number in statusline
set number              " show line numbers
set foldmethod=indent   " fold indented text
set foldlevel=99

set autochdir       " auto cd to current file directory
set splitbelow      " split new window below current window by default

set nohlsearch      " don't highlight search results
set incsearch       " incremental search
set smartcase       " uppercase characters cause case-sensitive search

set noerrorbells
set novisualbell
set visualbell t_vb=
autocmd! GuiEnter * set visualbell t_vb=

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
" color & font

if has('gui_running')
    set background=dark
    colorscheme github
    set guifont=Monaco:h13
    set linespace=5
else
    set background=dark
    colorscheme default
endif
