" ------------------------------------------------
" c/c++

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
let g:deoplete#sources#clang#libclang_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/opt/llvm/lib/clang/9.0.1/include/"

" ------------------------------------------------
" clojure

Plug 'Olical/conjure', {'tag': 'v4.14.1'}

" ------------------------------------------------
" elixir

Plug 'elixir-editors/vim-elixir'

" ------------------------------------------------
" elm

Plug 'elmcast/elm-vim'

" ------------------------------------------------
" fennel

Plug 'Olical/aniseed', { 'tag': 'v3.15.0' }
Plug 'bakpakin/fennel.vim'

" ------------------------------------------------
" git

Plug 'tpope/vim-git'

" ------------------------------------------------
" go

Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'fatih/vim-go'

" ------------------------------------------------
" haskell

Plug 'neovimhaskell/haskell-vim'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'alx741/vim-stylishask'
Plug 'godlygeek/tabular'

" ------------------------------------------------
" javascript

Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
if has('nvim')
    Plug 'carlitux/deoplete-ternjs'
endif

Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'raichoo/purescript-vim'

Plug 'kchmck/vim-coffee-script'
Plug 'jwhitley/vim-literate-coffeescript'
Plug 'noc7c9/vim-iced-coffee-script'


" ------------------------------------------------
" jinja2

Plug 'Glench/Vim-Jinja2-Syntax'

" ------------------------------------------------
" python

Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'

" ------------------------------------------------
" ruby

Plug 'alexgenco/neovim-ruby'
Plug 'fishbullet/deoplete-ruby'

" ------------------------------------------------
" rust

Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'cespare/vim-toml'
Plug 'gluon-lang/vim-gluon'
