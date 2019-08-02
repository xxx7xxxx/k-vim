call plug#begin('~/.vim/plugged')


" NOTICE: <Plug>xxx needs map but noremap.


" Standby plugin
" Plug 'chr4/nginx.vim'
" Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
" Plug 'elzr/vim-json'


Plug 'jiangmiao/auto-pairs'
    let g:AutoPairsMultilineClose = 0
    let g:AutoPairsCenterLine = 0


Plug 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims=1


Plug 'tpope/vim-repeat'


Plug 'bronson/vim-trailing-whitespace'
	nnoremap <leader>tw :FixWhitespace<cr>
	autocmd BufWritePre * FixWhitespace


Plug 'easymotion/vim-easymotion'
	let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
    let g:EasyMotion_smartcase = 1
    nmap <leader>h <Plug>(easymotion-linebackward)
    nmap <leader>j <Plug>(easymotion-j)
    nmap <leader>k <Plug>(easymotion-k)
    nmap <leader>l <Plug>(easymotion-lineforward)
    nmap <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-bd-f)
    nmap <leader>g <Plug>(easymotion-bd-f2)


Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1


Plug 'scrooloose/nerdtree'
	nnoremap <leader>tn :NERDTreeToggle<cr>
    let NERDTreeHighlightCursorline=1
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    let g:nerdtree_tabs_synchronize_view=0
    let g:nerdtree_tabs_synchronize_focus=0
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0


Plug 'majutsushi/tagbar'
	nnoremap <leader>tt :TagbarToggle<cr>
    let g:tagbar_autofocus = 1


Plug 'thinca/vim-quickrun'
    let g:quickrun_config = {
    \   "_" : {
    \       "outputter" : "message",
    \   },
    \}
    let g:quickrun_no_default_key_mappings = 1
    nmap <leader>r <Plug>(quickrun)


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
    autocmd FileType go nmap <leader>d <Plug>(go-def-vertical)
    autocmd FileType go nmap <leader>s <Plug>(go-def-pop)


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-go', { 'do': 'make'}
	let g:deoplete#sources#go#builtin_objects = 1
	let g:deoplete#sources#go#unimported_packages = 1


Plug 'Shougo/vimshell.vim'


Plug 'unblevable/quick-scope'
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


Plug 'Yggdroot/indentLine'
set list lcs=tab:\|\ 


call plug#end()
