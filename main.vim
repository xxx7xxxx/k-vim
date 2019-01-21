call plug#begin('~/.vim/plugged')


Plug 'flazz/vim-colorschemes'


Plug 'chr4/nginx.vim'
    au BufRead,BufNewFile *.nginx set ft=nginx
    au BufRead,BufNewFile */etc/nginx/* set ft=nginx
    au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
    au BufRead,BufNewFile nginx.conf set ft=nginx
    setlocal commentstring=#\ %s


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-go', { 'do': 'make'}


Plug 'jiangmiao/auto-pairs'
    let g:AutoPairsMultilineClose = 0
    let g:AutoPairsCenterLine = 0


Plug 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims=1


Plug 'tpope/vim-repeat'


Plug 'bronson/vim-trailing-whitespace'


Plug 'easymotion/vim-easymotion'
    let g:EasyMotion_smartcase = 1
    nnoremap <leader>h <Plug>(easymotion-linebackward)
    nnoremap <leader>j <Plug>(easymotion-j)
    nnoremap <leader>k <Plug>(easymotion-k)
    nnoremap <leader>l <Plug>(easymotion-lineforward)
    nnoremap <leader>. <Plug>(easymotion-repeat)
    nnoremap <Leader>f <Plug>(easymotion-bd-f)
    nnoremap <Leader>f <Plug>(easymotion-overwin-f)
    nnoremap <leader>g <Plug>(easymotion-overwin-f2)


Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1


Plug 'scrooloose/nerdtree'
    map <leader>n :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    map <Leader>n <plug>NERDTreeTabsToggle<CR>
    let g:nerdtree_tabs_synchronize_view=0
    let g:nerdtree_tabs_synchronize_focus=0
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0


Plug 'majutsushi/tagbar'
    let g:tagbar_autofocus = 1


Plug 'thinca/vim-quickrun'
    let g:quickrun_config = {
    \   "_" : {
    \       "outputter" : "message",
    \   },
    \}
    let g:quickrun_no_default_key_mappings = 1
    nnoremap <Leader>r <Plug>(quickrun)


Plug 'fatih/vim-go'
    let g:go_echo_command_info = 0
    let g:go_def_mapping_enabled = 0
    let g:go_template_autocreate = 0
    let g:go_highlight_types = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_interfaces = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_autodetect_gopath = 1
    let g:go_fmt_command = "goimports"
    " let g:go_fmt_fail_silently = 1
    autocmd FileType go nnoremap <leader>d <Plug>(go-def-vertical)


Plug 'unblevable/quick-scope'
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


Plug 'cespare/vim-toml'


Plug 'elzr/vim-json'


Plug 'plasticboy/vim-markdown'


Plug 'Yggdroot/indentLine'
set list lcs=tab:\|\ 


call plug#end()
