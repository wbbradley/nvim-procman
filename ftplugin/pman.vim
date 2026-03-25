if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal commentstring=#\ %s
setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
setlocal formatoptions=tcqlj

let b:undo_ftplugin = 'setlocal commentstring< shiftwidth< tabstop< softtabstop< expandtab< formatoptions<'
