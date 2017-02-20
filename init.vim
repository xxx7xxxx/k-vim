" install Vundle bundles
let mapleader = ','
let g:mapleader = ','
map <space> <leader>

syntax on

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" General Settings
filetype plugin indent on
set autoread
set nobackup
set noswapfile
set shortmess=atI
set history=2000
" set clipboard+=unnamedplus
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set title
set novisualbell
set noerrorbells
set tm=500
set viminfo^=%
set magic
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set incsearch
set ignorecase
set smartcase
set nofoldenable
set nospell
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#
colorscheme Tomorrow-Night-Bright
set background=dark
set guifont=monaco:20
set cc=80
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
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

" FileEncode Settings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,mac,dos
set formatoptions+=m
set formatoptions+=B

" Compltion Settings
set completeopt=longest,menu

" Tab Setting
autocmd TabLeave * let g:last_active_tab = tabpagenr()
let g:last_active_tab = 1

" Map Settings
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
noremap Q :q<CR>
noremap <F1> <Esc>"
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <F4> :nohl<CR>
noremap <F5> :QuickRun<CR>
set pastetoggle=<F6>
noremap <F7> :TagbarToggle<CR>
noremap <F8> :FixWhitespace<cr>
noremap <F9> :set wrap! wrap?<CR>
imap  <F1> <ESC><F1>
imap <F2> <ESC><F2>
imap <F3> <ESC><F3>
imap <F4> <ESC><F4>
imap <F5> <ESC><F5>
imap <F6> <ESC><F6>
imap <F7> <ESC><F7>
imap <F8> <ESC><F8>
imap <F9> <ESC><F9>
map <C-j> <C-W>j
map <C-k> <C-W>k
if has('nvim')
     nmap <BS> <C-W>h
endif
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap H ^
noremap L $
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
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

autocmd FileType c,cpp,go set tabstop=8 shiftwidth=8 expandtab ai
autocmd FileType ruby,json,toml,yaml set tabstop=2 shiftwidth=2 expandtab ai
autocmd BufRead,BufNewFile *.asm set filetype=nasm

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
        call append(1, "\# -*- encoding: utf-8 -*-")
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

" Spell Error Settings
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
