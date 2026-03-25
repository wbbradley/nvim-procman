if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal commentstring=#\ %s
setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
setlocal formatoptions=tcqlj

" Re-assert indent settings after editorconfig (which fires on BufRead,
" after our FileType handler). BufWinEnter fires after BufRead completes.
augroup pman_ftplugin
  autocmd! * <buffer>
  autocmd BufWinEnter <buffer> ++once setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
augroup END

let b:undo_ftplugin = 'setlocal commentstring< shiftwidth< tabstop< softtabstop< expandtab< formatoptions<'
      \ .. ' | autocmd! pman_ftplugin * <buffer>'
