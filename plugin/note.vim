" Vim plugin to write a note and manage in local directory
" File: note.vim
" Maintainer: KITAGAWA Yasutaka <kit494way@gmail.com>
" License: MIT License

if exists("g:loaded_note_vim")
  finish
endif
let g:loaded_note_vim = 1

command! -nargs=1 Note :call note#edit_timestamp_prefixed_file(<f-args>)
command! -nargs=0 NoteOpenCursor :call note#open(expand('<cfile>'))
command! -nargs=0 NotePwd :call note#pwd()
command! -nargs=? -complete=dir NoteCd :call note#cd(<f-args>)
command! -nargs=1 NoteMkdir :call note#mkdir(<f-args>)
command! -nargs=1 NoteGrep :call note#grep_note(<f-args>)
command! -nargs=0 NoteFind :call note#fzf_note()
