
" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" General Settings
syntax on
filetype plugin indent on
set autoread
set nobackup
set noswapfile
set shortmess=atI
set history=2000
set selection=inclusive
set selectmode=mouse,key
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set title
set novisualbell
set noerrorbells
set t_vb=
set tm=500
set viminfo^=%
set magic
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set incsearch
set ignorecase
set smartcase
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" UI Settings
colorscheme desert
set t_Co=256
set guifont=monaco:20
set background=dark
set cursorcolumn
set cursorline
set mouse=a
set mousehide
set ruler
set showcmd
set showmode
set scrolloff=7
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2
set number
set nowrap
set showmatch
set matchtime=2
set smartindent
set autoindent
set tabstop=8
set shiftwidth=8
set softtabstop=8
set smarttab
set expandtab
set shiftround
set relativenumber number
set wildmenu
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
au InsertEnter * :set norelativenumber number
au InsertLeave * :set relativenumber
function! NumberToggle()        "<C-n> change the number mode
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc



" Buffers Settings
set hidden
set wildmode=list:longest
set ttyfast

" FileEncode Settings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

" Compltion Settings
set completeopt=longest,menu

" Tab Setting
autocmd TabLeave * let g:last_active_tab = tabpagenr()
let g:last_active_tab = 1

" Map Settings
let mapleader = ','
let g:mapleader = ','
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
noremap <F1> <Esc>"
nnoremap <F2> :NERDTree<CR>
nnoremap <F3> :NERDTreeClose<CR>
nnoremap <F4> :nohl<CR>
nnoremap <F5> :set wrap! wrap?<CR>
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap H ^
noremap L $
nnoremap ; :
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
map <space> /
nnoremap / /\v
vnoremap / /\v
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap # *
nnoremap * #
nnoremap bp :bprevious<cr>
nnoremap bn :bnext<cr>
noremap <Up> :bp<CR>
noremap <Down> :bn<CR>
noremap <Left> :tabprevious<CR>
noremap <Right> :tabnext<CR>
nnoremap <C-n> :call NumberToggle()<cr>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap < <gv
vnoremap > >gv
map Y y$
map <Leader>sa ggVG"
nnoremap <leader>v V`}
cmap w!! w !sudo tee >/dev/null %
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <leader>q :q<CR>
nnoremap ' `
nnoremap ` '
nnoremap U <C-r>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Special Language Settings
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif
    normal G
    normal o
    normal o
endfunc

autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"

" Highlight Ketword Settings
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" GUI Settings
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" Spell Error Settings
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
