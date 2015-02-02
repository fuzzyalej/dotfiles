"'''''''"
" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic'
Plugin 'skwp/greplace.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()

filetype plugin indent on
syntax on
"'''''''"

set t_Co=256

" Changes leader key
let mapleader                      = ","

set autoindent
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set cursorline
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set encoding=utf-8
set clipboard=unnamed
set tags=tags;./;/                            " Search for ctags file up to /
set nowrap                                 " Whitespace stuff
set tabstop=2                              " Whitespace stuff
set shiftwidth=2                           " Whitespace stuff
set softtabstop=2                          " Whitespace stuff
set expandtab                              " Whitespace stuff
set list listchars=tab:\ \ ,trail:·        " Whitespace stuff
set hlsearch                               " Search stuff
set incsearch                              " Search stuff
set ignorecase                             " Search stuff
set smartcase                              " Search stuff
set laststatus=2                           " Status bar
set modelines=5                            " Status bar
set wrap                                   " Sets lines wrap
set hidden                                 " Buffers are just hidden when closing files
set ttyfast                                " Fasth terminal connection
set timeout timeoutlen=300 ttimeoutlen=300 " Timeout for keystrokes
set wildignore+=*.o                        " Ignored files paths
set wildignore+=*.obj                      " Ignored files paths
set wildignore+=.git                       " Ignored files paths
set wildignore+=*.rbc                      " Ignored files paths
set wildignore+=*.class                    " Ignored files paths
set wildignore+=.svn                       " Ignored files paths
set wildignore+=vendor/gems/*              " Ignored files paths
set wildignore+=*.jpg                      " Ignored files paths
set wildignore+=*.jpeg                     " Ignored files paths
set wildignore+=*.jpeg*                    " Ignored files paths
set wildignore+=*.png                      " Ignored files paths
set wildignore+=*.gif                      " Ignored files paths
set wildignore+=*/public/uploads/*         " Ignored files paths
set wildignore+=*/.git/*                   " Ignored files paths
set wildignore+=*/.bundle/*                " Ignored files paths
set wildignore+=*/bin/*                    " Ignored files paths
set wildignore+=*/log/*                    " Ignored files paths
set wildignore+=*/tmp/*                    " Ignored files paths
set wildignore+=*/.sass-cache/*            " Ignored files paths
set wildignore+=*/.jhw-cache/*             " Ignored files paths
set wildignore+=*/node_modules/*           " Ignored files paths
set noswapfile
set splitright                             " Vertical splits at right side
set splitbelow                             " Horizontal splits below
set gdefault                               " don't need /g after :s or :g

" Switch between buffers
" nmap <tab> <C-w><C-w>
" DISABLED, YOU ARE LAZY WITH THIS

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
  let g:ackprg="ack -H --nocolor --nogroup --column"
endif

" Numbers
set number

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

"Change windows"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use the mouse"
set mouse=a

set hlsearch

"Splits  ,v to open a new vertical split and switch to it
nn <leader>v <C-w>v<C-w>l
nn <leader>h <C-w>s<C-w>l

map  <leader>0 0gt
map  <leader>1 1gt
map  <leader>2 2gt
map  <leader>3 3gt
map  <leader>4 4gt
map  <leader>5 5gt
map  <leader>6 6gt
map  <leader>7 7gt
map  <leader>8 8gt
map  <leader>9 9gt

" Buffer navigation
map bn :bn<CR>
map bp :bp<CR>

"highlights
au BufNewFile,BufRead *.hamlc :set ft=haml
au BufNewFile,BufRead *.erb :set ft=eruby.html
au BufNewFile,BufRead *.rabl :set ft=ruby
au BufNewFile,BufRead *.eco :set ft=html
au BufNewFile,BufRead *.ejs :set ft=html
au BufNewFile,BufRead *.scm :nmap <leader>r :!racket -r %<CR>
au BufNewFile,BufRead *.rb :nmap <leader>r :!rspec %<CR>
au BufNewFile,BufRead *.rb :nmap <leader>R :!rspec<CR>
au BufNewFile,BufRead *.js :nmap <leader>r :!node %<CR>
au BufNewFile,BufRead *.json :%!python -m json.tool<CR>
au BufNewFile,BufRead *.asd :set ft=lisp
au BufNewFile,BufRead *.jbuilder :set ft=ruby

"Copy to clipboard
nmap Y :'<,'>!pbcopy<CR>

"Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" The looks of it
set guifont=Inconsolata\ for\ Powerline:h14
set background=dark
colorscheme zenburn

"gundo.vim
nnoremap U :GundoToggle<CR>

"Emacs-style movement keys (ala bash)
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

"Spelling
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_US

" Rename current file
" thx to codegram
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

set wildignore+=*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]((tmp)|\.(git))$',
      \ 'file': '\v\.(pyc)$',
\ }
" Make CtrlP use ag to list the files. SO MUCH FASTER
let g:ctrlp_user_commnad = 'ag %s -l --nocolor -g ""'

" Remove delay after pressing escape and clearing the visual selection
set timeoutlen=1000 ttimeoutlen=0

" Dangerous, remove automatically all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" JS goodies
let javascript_enable_domhtmlcss = 1
let g:syntastic_check_on_open=1
