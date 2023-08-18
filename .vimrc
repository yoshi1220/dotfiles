""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'

" Rails向けのコマンドを提供する
Plug 'tpope/vim-rails', {'for': 'ruby'}

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise', {'for': 'ruby'}

" 括弧等の補完
Plug 'cohama/lexima.vim'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" HTML/css補完
Plug 'mattn/emmet-vim'

" surround.vim
Plug 'tpope/vim-surround'

" open in browser
Plug 'tyru/open-browser.vim'

" javascriptのシンタックスハイライト
Plug 'othree/yajs.vim'

" NERDTree
Plug 'scrooloose/nerdtree'

" 閉じタグの自動補完
Plug 'alvan/vim-closetag'

" 複数行コメント
Plug 'tpope/vim-commentary'

" html, erbのインデント調整用
Plug 'othree/html5.vim'

" indent
Plug 'Yggdroot/indentLine'

" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'

Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
" Plug 'mattn/vim-lsp-icons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

""""""""""""""""""""""""""""""

" lspの設定
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 50
let g:lsp_text_edit_enabled = 1

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


" vim-go用の設定
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet']
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_gocode_propose_source = 0

" vim-closetag用の設定
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue'

" emmetの設定
let g:user_emmet_settings = {
\  'variables' : {
\    'lang' : "ja",
\    'charset' : "utf-8"
\  },
\  'indentation' : '  ',
\  'html' : {
\    'snippets' : {
\      'html:5': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<meta name=\"view-port\" content=\"width=device-width, initial-scale=1.0\">\n"
\        ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n"
\        ."\t<title>Document</title>\n"
\        ."</head>\n"
\        ."<body>\n\t${child}|\n</body>\n"
\        ."</html>",
\    }
\  }
\}

" indent
let g:indentLine_faster = 1
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1



" insert mode jj bind esc
inoremap <silent> jj <ESC>



""""""""""""""""""""""""""""
syntax on

set nowrap

set hlsearch
set ignorecase
set smartcase

set autoindent

set ruler
set number
set nolist
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed

set backspace=indent,eol,start

set autowrite

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && !isdirectory(argv()[0]) && !exists("s:std_in") | NERDTree | wincmd p | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" set pythonthreedll=C:\Anaconda3\python38.dll

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

" swpファイル出力無効
set noswapfile
" バックアップファイル出力無効
set nobackup
" undoファイル出力無効
set noundofile
