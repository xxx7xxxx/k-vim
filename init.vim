" Leader
let g:mapleader = ' '


" Plugin
source ~/.vim/main.vim


" General
colorscheme Tomorrow-Night-Bright
filetype plugin indent on
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
syntax on


" Abbrs
cnoreabbrev h vert h
cnoreabbrev help vert help
cnoreabbrev Q q
cnoreabbrev Vsp vsp
cnoreabbrev VSp vsp
cnoreabbrev VSP vsp


" Options
set background=light
" set clipboard=unnamedplus
set completeopt=menu,longest,noinsert,noselect
set cursorline
set formatoptions+=m
set hidden
set laststatus=0
set laststatus=2
set matchtime=1
set mouse=a
set noincsearch
set noswapfile
set nowrap
set number
set relativenumber
set scrolloff=10
set shiftround
set showmatch
set smartcase
set smartindent
set softtabstop=8
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
nnoremap db dib " delete inner () - equal to `onoremap b ib`
nnoremap dB diB " delete inner {} - equal to `onoremap B iB`
nnoremap dq di"
nnoremap ds di'
nnoremap U <C-r>
" http://vim.wikia.com/wiki/Improve_completion_popup_menu
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Movement
noremap H ^
noremap L $
noremap Y y$
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

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

" Search Stuff
nnoremap / /\v
nnoremap <leader>n :nohl<cr>

" MISC
nnoremap <C-g> :echo expand('%:p')<cr>
cnoremap w!! w !sudo tee >/dev/null %


" Autocmd
" Help
autocmd FileType help set number

" Indent
autocmd FileType ruby,javascript,typescript,graphql,json,toml,yaml,proto
			\ set tabstop=2 shiftwidth=2
autocmd FileType vim,shell,markdown set tabstop=4 shiftwidth=4
autocmd FileType c,cpp,go set tabstop=8 shiftwidth=8


" Recording
" Reference: help last-position-jump
" neovim doesn't do it by default
" https://github.com/neovim/neovim/issues/4360
" https://github.com/neovim/neovim/issues/3472
autocmd BufReadPost *
			\	if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
			\ |   execute "normal! g`\""
			\ | endif
