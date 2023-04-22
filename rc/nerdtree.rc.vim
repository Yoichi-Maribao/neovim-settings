nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-e> :NERDTreeFind<CR>
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
  let args = {
  \   'source': 'rg --files -- ' . path,
  \   'sink': function('FzfFindFilesSink'),
  \   'down': '~50%',
  \ }
  call fzf#run(fzf#wrap(args))
endfunction
function! FzfFindFilesSink(files)
  execute 'NERDTreeFind' a:files
endfunction
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
 
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

