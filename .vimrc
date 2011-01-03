syntax on
colorscheme desert
set number

set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

map ,t :FuzzyFinderFile **/<CR>
map ,f :FuzzyFinderFile<CR>

highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

nmap <silent> <leader>l :set list!<CR>
map ,ws :%s/\s\+$//e<CR>

map ,gp :Gist -p<CR>
map ,gst :Gist<CR>
map ,ga :Gist -a<CR>
noremap ,bc :s#^#//<CR>
noremap ,cf :echo expand("%:p")<CR>

autocmd FileType make setlocal noexpandtab
