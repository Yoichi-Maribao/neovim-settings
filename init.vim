" leaderをスペースに設定
let mapleader = "\<Space>"

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif
""dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.config/nvim/dein')

  " XDG base direcory compartible
  let g:dein#cache_directory = $HOME . '/.cache/dein'

  " dein begin
  call dein#begin($HOME . '/.config/nvim/dein')

 " プラグインリストを収めた TOML ファイル
 " 予め TOML ファイル（後述）を用意しておく
 let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
 let s:toml      = s:toml_dir . '/dein.toml'
 let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

 " TOML を読み込み、キャッシュしておく
 call dein#load_toml(s:toml,      {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" NERDTree
map <C-l> gt
map <C-h> gT
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeFocus<CR>
" show dotfiles
let NERDTreeShowHidden=1
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\node_modules$[[dir]]', '\vendor\bundler$'] 

" function to find file under current node
function! NERDTreeFindFile(node)
  if a:node.path.isDirectory == 1
    let path = a:node.path.str()
  else
    let path = a:node.path.getDir().str()
  endif
  echo path
  NERDTreeClose
  call fzf#vim#files(path)
endfunction
" function to grep files under current node
function! NERDTreeGrepFile(node)
  if a:node.path.isDirectory == 1
    let path = a:node.path.str()
  else
    let path = a:node.path.getDir().str()
  endif
  NERDTreeClose
  call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case \"\" ".shellescape(path), 1, fzf#vim#with_preview())
endfunction
augroup nerdtree
  autocmd!
  " find file under current node
  autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'zf',
        \ 'callback': 'NERDTreeFindFile',
        \ 'quickhelpText': 'find file under current node',
        \ 'scope': 'Node' })
  " grep files under current node
  autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'zg',
        \ 'callback': 'NERDTreeGrepFile',
        \ 'quickhelpText': 'grep files under current node',
        \ 'scope': 'Node' })
augroup END
 
"Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" jjで通常モードに変更 
inoremap <silent> jj <ESC> 
inoremap <silent> っj <ESC>
" 行番号を表示
set number
" シンタックスハイライトを有効化
syntax enable
" コメントアウトを改行した時の自動コメントアウトを無効化
set formatoptions-=o
set formatoptions-=r
" テーマをmolokaiにする

colorscheme molokai
set t_Co=256
set termguicolors

" clipboardをyankとシンクロ
set clipboard+=unnamed

" Tab系 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 括弧入力時の対応する括弧を表示
set showmatch

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" set leaderをスペースに設定

" For vim-devicons
" set charset
set encoding=utf8
" for vim-airline
let g:airline_theme = 'simple'
let g:airline#extension#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
