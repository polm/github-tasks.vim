function! ToggleTodo()
  let l:winview = winsaveview()
  if len(matchlist(getline('.'),'^ *- \[ *\]')) > 0
    " not done, mark done
    execute ':s/^\( *\)- \[ *\]/\1- [x]/'
  elseif len(matchlist(getline('.'),'^ *- \[.\]')) > 0
    " done, mark un-done
    execute ':s/^\( *\)- \[.\]/\1- [ ]/'
  elseif len(matchlist(getline('.'),'^ *- ')) > 0
    " not a todo yet, make it one
    execute ':s/^\( *\)- /\1- [ ] /'
  endif
  " otherwise assume the press was accidental and do nothing
  call winrestview(l:winview)
endfunction
nnoremap <silent> <tab> :call ToggleTodo()<cr>
