" ------------------------------------------------
" autocomplete

call EnableCoc()

" ------------------------------------------------
" formatting

let g:ormolu_command = "ormolu"

let g:ormolu_disable = 0
let g:hindent_on_save = 0
let g:stylishask_on_save = 0

" ------------------------------------------------
" highlighting

let g:haskell_enable_quantification = 1   " highlight `forall`
let g:haskell_enable_recursivedo = 1      " highlight `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " highlight `proc`
let g:haskell_enable_pattern_synonyms = 1 " highlight `pattern`
let g:haskell_enable_typeroles = 1        " highlight type roles
let g:haskell_enable_static_pointers = 1  " highlight `static`
let g:haskell_backpack = 1                " highlight backpack keywords

" ------------------------------------------------
" module headers

let s:width = 72
function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "--  " . name . "\n"
    \       . "\n"
endfunction
nmap <silent> --s "=HaskellModuleSection()<CR>gp

" ------------------------------------------------
" tabular

let g:haskell_tabular = 0
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>
