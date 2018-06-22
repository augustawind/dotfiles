let g:deoplete#sources#rust#racer_binary = "/Users/dtr/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path = "/Users/dtr/src/rust"
let g:deoplete#sources#rust#show_duplicates = 1

let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

nmap gs <Plug>DeopleteRustGoToDefinitionSplit
nmap gv <Plug>DeopleteRustGoToDefinitionVSplit

nmap <Leader>f  :Cargo fmt<Enter>
nmap <Leader>t  :Cargo test<Enter>
nmap <Leader>c  :Cargo check<Enter>
nmap <Leader>b  :Cargo build<Enter>
nmap <Leader>B  :Cargo build --release<Enter>
nmap <Leader>r  :Cargo run<Enter>
nmap <Leader>R  :Cargo run --release<Enter>
