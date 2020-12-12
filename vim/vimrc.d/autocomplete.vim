set completeopt=menuone,menu,longest
set wildmenu
set wildmode=longest,list,full
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox

if has('nvim')
    " ------------------------------------------------------------------
    " deoplete - enabled by default

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    Plug 'Shougo/neoinclude.vim'

    " ------------------------------------------------------------------
    " CoC language server - disabled by default

    set hidden
    Plug 'neoclide/coc.nvim',
                \ { 'branch': 'release',
                \   'do': ':CocInstall coc-json coc-lua coc-elixir'
                \ }
    let g:coc_start_at_startup = 0

    function! EnableCoc()
        call deoplete#disable()
        :CocStart

        " GoTo code navigation.
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Symbol renaming.
        nmap <leader>rn <Plug>(coc-rename)

        " Use K to show documentation in preview window.
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        " Formatting.
        command! -nargs=0 Format :call CocAction('format')
    endfunction

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
