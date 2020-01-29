set completeopt=menuone,menu,longest
set wildmenu
set wildmode=longest,list,full
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox

if has('nvim')
    " deoplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1

    " LanguageClient
    set hidden
    Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }
    nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

    nnoremap <leader>lS :LanguageClientStop<CR>
    nnoremap <leader>ls :LanguageClientStart<CR>
    nnoremap <leader>R :LanguageClientStop<CR> <bar> :sleep 1<CR> <bar> :LanguageClientStart<CR>

    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'
else
    Plug 'Shougo/vimproc.vim'
    Plug 'Shougo/neocomplete.vim'

    let g:neocomplete#auto_complete_delay = 0
    let g:neocomplete#enable_at_startup = 1

    if !exists('g:neocomplete#sources#omni#functions')
        let g:neocomplete#sources#omni#functions = {}
    endif
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
endif

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<c-n>'
