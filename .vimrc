" Vundle
" Install vundle: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" Install bundles: vim +BundleInstall +qall
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'bling/vim-airline'
Bundle 'd11wtq/tomorrow-theme-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skwp/greplace.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplete.vim'

filetype plugin indent on
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
nmap <tab> <C-w><C-w>

" Remember last location in file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
   \| exe "normal g'\"" | endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"
syntax on

filetype plugin indent on

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

" by Elias (WeRelax)
" 13 de Octubre 2011: CoffeeScript correctness check
function! CheckCoffeeSyntax (file)
  let l:js = system('coffee -cp ' . a:file)
  let l:error = matchstr(l:js, '^Error: .* line \d*')
  if empty(l:error)
    return
  else
    :echohl ErrorMsg | echo l:error | echohl None
  endif
endfunction
autocmd! BufWritePost *.coffee :call CheckCoffeeSyntax(expand("%:p"))
"-------

" Sort and Unique .gitignore file"
function! SortAndUnique()
  %sort u
endfunction
autocmd! BufWritePost .gitignore :call SortAndUnique()

"Cleaning options for gvim/mvim"
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar"

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

""""""""""""""""""""""""""""""""""""""""""
" Fri Mar 9: Cool split auto-resizing (via the great Gary Bernhardt)
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But
" if we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

"highlights
au BufNewFile,BufRead *.hamlc :set ft=haml
au BufNewFile,BufRead *.rabl :set ft=ruby
au BufNewFile,BufRead *.eco :set ft=html
au BufNewFile,BufRead *.ejs :set ft=html
au BufNewFile,BufRead *.scm :nmap <leader>r :!racket -r %<CR>
au BufNewFile,BufRead *.clj :set ft=clojure<CR> :nmap <leader>r :!clj %<CR>
au BufNewFile,BufRead *.rb :nmap <leader>r :!rspec %<CR>
au BufNewFile,BufRead *.rb :nmap <leader>R :!rspec<CR>
au BufNewFile,BufRead *.js :nmap <leader>r :!node %<CR>
au BufNewFile,BufRead *.json :%!python -m json.tool<CR>
au BufNewFile,BufRead *.asd :set ft=lisp

"Copy to clipboard
nmap Y :'<,'>!pbcopy<CR>

"Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

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

"Unite.vim
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yanks<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

"Spelling
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_US

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
