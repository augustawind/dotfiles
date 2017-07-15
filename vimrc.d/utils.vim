" session management (gui only)
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_autosave = 'yes'

" session management
Plug 'tpope/vim-obsession'

" file explorer
Plug 'tpope/vim-vinegar'

" fuzzy find-anywhere
Plug 'kien/ctrlp.vim'
map <silent> <Leader>p :CtrlP()<CR>
" noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

" unify tabs and buffers
Plug 'ap/vim-buftabline'

" dash app support
Plug 'rizzatti/dash.vim'
nmap <Leader>D :Dash<CR>
