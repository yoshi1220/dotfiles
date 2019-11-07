""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'

Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neocomplcache-rsense.vim'

" Rails向けのコマンドを提供する
Plug 'tpope/vim-rails', {'for': 'ruby'}

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise', {'for': 'ruby'}

" 括弧等の補完
Plug 'cohama/lexima.vim'

" python補完
Plug 'davidhalter/jedi-vim', {'for': 'python'}   " pythonファイルを編集するときだけ起動

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

call plug#end()
""""""""""""""""""""""""""""""

" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

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

" filetype plugin indent on

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
augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && !isdirectory(argv()[0]) && !exists("s:std_in") | NERDTree | wincmd p | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
