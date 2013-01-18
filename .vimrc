syntax on
colorscheme ir_black-256
set number

filetype plugin on
filetype plugin indent on
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

autocmd FileType java set tabstop=4|set shiftwidth=4
autocmd BufRead,BufNewFile *.ejs set filetype=html

let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.DS_Store$|\.jpg$|\.gif$|\.png$|\.bak$|\.swp$|\.git$|\.svn$|gen|\.git|\.gradle|build/'

map ,t :FuzzyFinderFile **/<CR>
map ,f :FuzzyFinderFile<CR>
map ,rc :FuzzyFinderRenewCache<CR>

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

noremap ,nt :NERDTreeToggle<CR>

autocmd FileType make setlocal noexpandtab
set guifont=Monaco:h16

augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

