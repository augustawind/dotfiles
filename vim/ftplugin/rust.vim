let g:deoplete#sources#rust#racer_binary = "/Users/dtr/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path = "/Users/dtr/src/rust/src"
let g:deoplete#sources#rust#show_duplicates = 1

nmap gd <Plug>(rust-def)
nmap gs <Plug>(rust-def-split)
nmap gx <Plug>(rust-def-vertical)
nmap <leader>gd <Plug>(rust-doc)
