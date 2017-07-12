Plug 'garbas/vim-snipmate'

Plug 'xolox/vim-session'
let g:session_autosave = 'yes'

Plug 'rizzatti/dash.vim'
nmap <D-D> :Dash<CR>

Plug 'kien/ctrlp.vim'
map <silent> <Leader>p :CtrlP()<CR>
" noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.ropeproject$', '\.o', '\.hi']
