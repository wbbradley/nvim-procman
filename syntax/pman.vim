if exists('b:current_syntax')
  finish
endif

" Comments
syn match pmanComment /#.*$/ contains=pmanTodo
syn keyword pmanTodo TODO FIXME XXX contained

" Block keywords (top-level)
syn keyword pmanBlockKeyword config job service event

" Keywords
syn keyword pmanKeyword env run wait watch after on_fail spawn glob arg if for in
syn keyword pmanKeyword http connect exists running shutdown debug log
syn match pmanKeyword /\<contains\>/

" Booleans and none
syn keyword pmanBoolean true false
syn keyword pmanNone none

" Types
syn keyword pmanType string bool

" Field names
syn keyword pmanFieldName status timeout poll retry initial_delay threshold
syn keyword pmanFieldName type default short description logs log_time format key var

" Strings
syn region pmanString start=/"/ skip=/\\\\\|\\"/ end=/"/ oneline contains=pmanEscape
syn match pmanEscape /\\[\\\"nt]/ contained

" Fenced strings (triple backtick)
syn region pmanFencedString start=/```/ end=/```/

" Numbers (defined before durations so durations take priority)
syn match pmanNumber /\<\d\+\%(\.\d\+\)\?\>/

" Durations: number + suffix (5s, 500ms, 2.5m)
syn match pmanDuration /\<\d\+\%(\.\d\+\)\?\%(ms\|[sm]\)\>/

" References: @job and @job.KEY
syn match pmanReference /@[a-zA-Z_][a-zA-Z0-9_-]*\%(\.[a-zA-Z_][a-zA-Z0-9_-]*\)\?/

" Args references: args.name
syn match pmanArgsRef /\<args\.[a-zA-Z_][a-zA-Z0-9_-]*/

" Operators
syn match pmanOperator /==\|!=\|<=\|>=\|<\|>\|&&\|||\|!/

" Link highlight groups
hi def link pmanBlockKeyword Statement
hi def link pmanKeyword Keyword
hi def link pmanBoolean Boolean
hi def link pmanNone Constant
hi def link pmanType Type
hi def link pmanFieldName Identifier
hi def link pmanString String
hi def link pmanEscape SpecialChar
hi def link pmanFencedString String
hi def link pmanNumber Number
hi def link pmanDuration Number
hi def link pmanReference Special
hi def link pmanArgsRef Special
hi def link pmanOperator Operator
hi def link pmanComment Comment
hi def link pmanTodo Todo

" Sync from start to handle long fenced string blocks
syn sync fromstart

let b:current_syntax = 'pman'
