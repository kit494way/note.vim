" Vim plugin to write a note and manage in local directory
" File: note.vim
" Maintainer: KITAGAWA Yasutaka <kit494way@gmail.com>
" License: MIT License

function! s:default_note_dir()
  if exists('g:note_vim_default_dir')
    return expand(g:note_vim_default_dir)
  else
    return getcwd()
  endif
endfunction

function! s:note_dir()
  if exists('g:note_vim_dir')
    return g:note_vim_dir
  else
    return s:default_note_dir()
  endif
endfunction

function! note#pwd()
  echo s:note_dir()
endfunction

function! note#cd(...)
  if a:0 == 0
    let g:note_vim_dir = g:note_vim_default_dir
    return
  endif

  let path = a:1
  if strlen(path) == 0
    let g:note_vim_dir = g:note_vim_default_dir
  elseif path[0] == '/'
    let g:note_vim_dir = path
  elseif path[0] == '~'
    let g:note_vim_dir = expand(path)
  else
    let g:note_vim_dir = simplify(s:note_dir() . '/' . path)
  endif
endfunction

function! note#mkdir(name)
  let dir_path = simplify(s:note_dir() . '/' . a:name)
  call mkdir(dir_path)
endfunction

function! note#edit_timestamp_prefixed_file(name)
  let file_name = strftime('%Y%m%d%H%M%S-') . a:name
  let file_path = substitute(s:note_dir(), '\/\+$', '', 'g') .'/' . file_name
  execute 'e ' . file_path
endfunction

function! note#open(file_name)
  execute 'e ' . simplify(s:note_dir() . '/' . a:file_name)
endfunction

function! note#grep_note(word)
  if exists(':Ack!')
    execute 'Ack! ' . a:word . ' ' . s:note_dir()
  else
    echomsg ':Ack! not found'
  endif
endfunction

function! note#fzf_note()
  if exists(':FZF')
    execute 'FZF ' . s:note_dir()
  else
    echomsg ':FZF not found'
  endif
endfunction
