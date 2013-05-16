syntax on
colorscheme jellybeans
set number
set smartindent
set autoindent
set expandtab

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'instant-markdown'
Bundle 'cocoa.vim'
Bundle 'vim-jade'
Bundle 'vim-javascript'
Bundle 'vim-fugitive'
Bundle 'smali-vim'

filetype plugin indent on

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

let g:acp_behaviorJavaEclimLength = 3
function MeetsForJavaEclim(context)
  return g:acp_behaviorJavaEclimLength >= 0 &&
        \ a:context =~ '\k\.\k\{' . g:acp_behaviorJavaEclimLength . ',}$'
endfunction
let g:acp_behavior = {
    \ 'java': [{
      \ 'command': "\<c-x>\<c-u>",
      \ 'completefunc' : 'eclim#java#complete#CodeComplete',
      \ 'meets'        : 'MeetsForJavaEclim',
    \ }]
  \ }

let g:instant_markdown_slow = 1
