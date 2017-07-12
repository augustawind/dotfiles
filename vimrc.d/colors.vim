Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'endel/vim-github-colorscheme'
Plug 'jnurmine/Zenburn'
Plug 'rakr/vim-one'

" ------------------------------------------------
" settings

if has('gui_running')
    set background=dark
    colorscheme one
    set guifont=Monaco:h13
    set linespace=5
else
    set background=dark
    colorscheme one
endif
