let g:rc_dir = expand('~/.config/nvim/rc')
" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction


"------------------------------------------------------------------------------
" init.rc.vim
call s:source_rc('init.rc.vim')

" editor.rc.vim
call s:source_rc('editor.rc.vim')

" color.rc.vim
call s:source_rc('color.rc.vim')

" dein.rc.vim
call s:source_rc('dein.rc.vim')

" coc.vim
call s:source_rc('coc.rc.vim')

" vim-devicon.vim
call s:source_rc('devicon.rc.vim')

" airline.vim
call s:source_rc('airline.rc.vim')

" fzf.vim
call s:source_rc('fzf.rc.vim')

" nerdtree.rc.vim
call s:source_rc('nerdtree.rc.vim')

