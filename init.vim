" Leader
let g:mapleader = ' '


" Plugin
source ~/.vim/main.vim


" General
colorscheme Tomorrow-Night-Bright
filetype plugin indent on
syntax on


" Abbrs
cnoreabbrev h vert h
cnoreabbrev help vert help


" Options
set autoindent
set autoread
set background=dark
set backspace=eol,start,indent
set clipboard=unnamedplus
set completeopt=longest,menu
set cursorline
set encoding=utf-8
set expandtab
set ffs=unix,mac,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set formatoptions+=B
set formatoptions+=m
set guifont=monaco:20
set hidden
set history=2000
set ignorecase
set incsearch
set laststatus=2
set magic
set matchtime=2
set mouse=a
set mousehide
set nobackup
set noerrorbells
set nofoldenable
set nospell
set noswapfile
set novisualbell
set nowrap
set number
set relativenumber
set ruler
set scrolloff=7
set shiftround
set shiftwidth=4
set shortmess=atI
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set termencoding=utf-8
set timeoutlen=1000
set title
set whichwrap+=<,>,h,l
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set wildmenu
set wildmode=list:longest


" Map
" Command Model
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Vimrc
nnoremap <leader>ve :vsp $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" File
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>p :set wrap!<cr>

" Edit
nnoremap m mk
nnoremap ym y'k

" Motion
noremap H ^
noremap L $
noremap Y y$
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap U <C-r>
nnoremap <leader>q :q<cr>
nnoremap dq di"
nnoremap ds di'

" Buffer
noremap <Up> :bp<cr>
noremap <Down> :bn<cr>

" Tab
nnoremap <C-t> :tabnew<cr>
nnoremap <Left> :tabprevious<cr>
nnoremap <Right> :tabnext<cr>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" Window Movement
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
if has('nvim')
    nnoremap <BS> <C-W>h
endif
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Quickly Call Plugin
nnoremap <leader>tn :NERDTreeToggle<cr>
nnoremap <leader>tt :TagbarToggle<cr>
nnoremap <leader>fw :FixWhitespace<cr>

" Search Stuff
nnoremap / /\v
nnoremap <leader>n :nohl<cr>

" MISC
nnoremap <C-g> :echo expand('%:p')<cr>
cnoremap w!! w !sudo tee >/dev/null %


" Autocmd
" Line Number
autocmd FocusLost   * :set norelativenumber
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Indent
autocmd FileType c,cpp,go set tabstop=8 shiftwidth=8 expandtab ai
autocmd FileType java,shell,markdown set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,typescript,graphql,json,toml,yaml,proto set tabstop=2 shiftwidth=2 expandtab ai
