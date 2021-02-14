" leader key
let g:mapleader = "\\"

" quick save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" sane vim splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" reload .vimrc
map <leader>s :source $MYVIMRC<CR>

" edit vimrc.d/
map <leader>e :e ~/.vim/vimrc.d/<CR>

" fold/unfold with space
nnoremap <space> za

" navigate/close quickfix
map <leader>n :cnext<CR>
map <leader>m :cprevious<CR>
map <leader>a :cclose<CR>

" chdir to current file
map <leader>. :lcd %:p:h<CR>
" chdir to parent directory
map <leader>_ :lcd ..<CR>

" navigate buffers easily
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-X> :bdelete<CR>

" make ZZ shortcut use :xa instead of :wq
nnoremap ZZ :xa<CR>

" run linter autofix utility (plugin: 'w0rp/ale')
map <leader>f :ALEFix<CR>

" cycle thru installed colorschemes (plugin: 'xolox/vim-colorscheme-switcher')
map <leader>( :PrevColorScheme<CR>
map <leader>) :NextColorScheme<CR>

" cycle thru light/dark background
map <leader>g :call BackgroundToggle()<CR>

function! BackgroundToggle()
    if &background == "light"
        execute "set background=dark"
    else
        execute "set background=light"
    endif
endfunction

" open/close tag browser
nnoremap <leader>t :TagbarToggle<CR>

" fuzzy finder (plugin: junegunn/fzf.vim)
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" file browser (plugin: Shougo/defx.vim)
map <C-space> :Defx<CR>
nmap - :Defx<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction
