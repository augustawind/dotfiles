call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})

let b:ale_linters = {
            \ 'clojure': ['clj-kondo', 'joker']
            \ }
