syntax on
set number
set smartindent
set autoindent
set expandtab

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'nerdtree'
Bundle 'instant-markdown'
Bundle 'cocoa.vim'
Bundle 'vim-jade'
Bundle 'vim-javascript'
Bundle 'vim-javascript-syntax'
Bundle 'vim-fugitive'
Bundle 'smali-vim'
Bundle 'vim-golang'
Bundle 'ctrlp.vim'
Bundle 'webapi-vim'
Bundle 'gist-vim'
Bundle 'vim-coffee-script'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/saltstack/salt-vim.git'
Bundle 'https://github.com/elzr/vim-json.git'
Bundle 'https://github.com/wting/rust.vim'
Bundle 'chase/vim-ansible-yaml'
"Bundle 'https://github.com/fatih/molokai.git'
Bundle 'https://github.com/tomasr/molokai.git'
Bundle 'https://github.com/fatih/vim-go.git'
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
"Bundle 'https://github.com/vim-scripts/aftersyntaxc.vim.git'

let g:molokai_original = 1
"let g:rehash256 = 1
"let g:solarized_termcolors=256
"colorscheme jellybeans
"colorscheme solarized
colorscheme molokai
"set background=dark

filetype plugin indent on

set tabstop=4
set shiftwidth=4
let mapleader=","

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

map ,nt :NERDTree<CR>

autocmd FileType make setlocal noexpandtab
set guifont=Monaco:h16

augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

set backupdir=~/.vim/backup/
set backspace=indent,eol,start
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

map ,tn :tabnew<CR>
map ,tc :tabclose<CR>
map ,tl :tabp<CR>
map ,tr :tabn<CR>

map ,ji :JavaImport<CR>
map ,jio :JavaImportOrganize<CR>
map ,jim :JavaImpl<CR>

"Rename tabs to show tab# and # of viewports
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            let s .= i
            if tabpagewinnr(i,'$') > 1
                let s .= '.'
                let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
                let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
            end

            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

" window
nmap <leader>swh  :topleft  vnew<CR>
nmap <leader>swl :botright vnew<CR>
nmap <leader>swk    :topleft  new<CR>
nmap <leader>swj  :botright new<CR>
" buffer
nmap <leader>sh   :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk     :leftabove  new<CR>
nmap <leader>sj   :rightbelow new<CR>

let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

map <leader>gs :InsertBothGetterSetter<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:EclimCompletionMethod = 'omnifunc'
