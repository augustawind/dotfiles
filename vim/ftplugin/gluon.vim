let g:LanguageClient_serverCommands = {
            \ 'gluon': ['gluon_language-server'],
            \ }

" Automatically start language servers.
let b:LanguageClient_autoStart = 1

command! GluonFmt
            \ execute('!gluon fmt %')
            \ <bar> edit
            \ <bar> call feedkeys("\<CR>")

nnoremap <leader>F :write<CR>:GluonFmt<CR>

autocmd! BufWritePost *.glu GluonFmt
