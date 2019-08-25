# note.vim

Write/read and manage notes in local directory.

## Installation

For dein.vim

```
call dein#add('kit494way/note.vim')
```

## Configuration

```vim
let g:note_vim_default_dir='~/note'
```

This is the note directory where note is saved.
If not set, notes are saved in current directory.

## Usage

```
:Note {filename}
```

Open a new file `%Y%m%d%H%M%S-{filename}` in the note directory.
`%Y%m%d%H%M%S` is replaced by current time.
The note directory is set by `g:note_vim_default_dir`, default is current directory.

```
:NoteOpenCursor
```

Open a file path under the cursor in the note directory.
If the path under cursor is example.md, open a `example.md` in the note directory.

```
:NoteCd [directory]
```

Change the note directory. If `[directory]` is omitted, `g:note_vim_default_dir` is used.

```
:NotePwd
```

Show current note directory.

```
:NoteFind
```

Fuzzy find file in the note directory by file name. This requires [fzf](https://github.com/junegunn/fzf) and fzf.vim.

```
:NoteGrep {pattern}
```

Search files in the note directory. This requires [ack.vim](https://github.com/mileszs/ack.vim).
