syntax on
colorscheme desert
set number

set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

map ,t :FuzzyFinderFile **/<CR>
map ,f :FuzzyFinderFile<CR>

autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
