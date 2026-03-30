if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal indentexpr=PmanIndent()
setlocal indentkeys=0{,0},!^F,o,O

if exists('*PmanIndent')
  finish
endif

" Returns 1 if line lnum is inside a fenced string block (between """ markers).
" Counts """ occurrences from line 1 to lnum-1; odd count means inside.
function! s:InFencedBlock(lnum) abort
  let l:count = 0
  let l:i = 1
  while l:i < a:lnum
    if getline(l:i) =~# '"""'
      let l:count += 1
    endif
    let l:i += 1
  endwhile
  return l:count % 2
endfunction

" Find the effective previous line, skipping blank lines and fenced blocks.
" If prev non-blank is inside a fenced block or is a closing """, walk back
" to the opening """ and use that as the effective previous line.
function! s:PrevEffectiveLine(lnum) abort
  let l:prev = prevnonblank(a:lnum - 1)
  if l:prev == 0
    return 0
  endif
  " If the previous line is inside a fenced block or is the closing """,
  " walk back to the opening """ line.
  if s:InFencedBlock(l:prev) || getline(l:prev) =~# '"""'
    while l:prev > 0 && (s:InFencedBlock(l:prev) || getline(l:prev) =~# '"""')
      let l:prev -= 1
    endwhile
    let l:prev = prevnonblank(l:prev)
  endif
  return l:prev
endfunction

function! PmanIndent() abort
  let l:lnum = v:lnum

  " Inside fenced block: preserve existing indent
  if s:InFencedBlock(l:lnum)
    return -1
  endif

  " On a closing """ line: preserve existing indent
  if getline(l:lnum) =~# '"""'
    return -1
  endif

  let l:prev = s:PrevEffectiveLine(l:lnum)
  if l:prev == 0
    return 0
  endif

  let l:prev_indent = indent(l:prev)
  let l:prev_line = getline(l:prev)
  let l:cur_line = getline(l:lnum)

  " Increase indent after lines ending with {
  if l:prev_line =~# '{\s*$'
    let l:prev_indent += shiftwidth()
  endif

  " Decrease indent on lines starting with }
  if l:cur_line =~# '^\s*}'
    let l:prev_indent -= shiftwidth()
  endif

  return l:prev_indent < 0 ? 0 : l:prev_indent
endfunction
