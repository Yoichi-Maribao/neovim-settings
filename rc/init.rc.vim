source $VIMRUNTIME/macros/matchit.vim
" leaderをスペースに設定
let mapleader = "\<Space>"

" jjで通常モードに変更 
inoremap <silent> jj <ESC> 
inoremap <silent> っj <ESC>
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" set leaderをスペースに設定


" 画面幅変更
nmap <Leader>+ :vertical resize +10<CR>
nmap <Leader>- :vertical resize -10<CR>

" 矢印キーは甘え
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
