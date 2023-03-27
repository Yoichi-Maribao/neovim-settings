" for fzf#vim#with_preview
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" call :Files
nmap <leader>f :Files<CR>
