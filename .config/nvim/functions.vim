"" Custom functions for VIM

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  CompletorDisable
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
"  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  CompletorEnable
endfunction

function! RemoveAllUnnecassaryCharacters()
    IndentLinesDisable
    GitGutterDisable
    set nonumber
endfunction

function! AddAllUnnecassaryCharacters()
    IndentLinesEnable
    GitGutterEnable
    set number
endfunction

command! RemoveAllUnnecassaryCharacters call RemoveAllUnnecassaryCharacters()
command! AddAllUnnecassaryCharacters call AddAllUnnecassaryCharacters()

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
