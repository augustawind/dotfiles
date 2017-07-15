let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

if !has('nvim')
    call neocomplete#util#set_default_dictionary(
                \ 'g:neocomplete#sources#omni#input_patterns',
                \ 'elm',
                \ '\.')
endif
