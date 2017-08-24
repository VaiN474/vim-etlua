" Language:     etlua
" Maintainer:   VaiN <vain474@gmail.com>
" License:      WTFPL
" Last Change:  April 21 2015

if !exists("main_syntax")
  let main_syntax = 'html'
endif

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/html.vim

unlet b:current_syntax
syntax include @HTML syntax/html.vim

"unlet b:current_syntax
"syntax include @Lua syntax/lua.vim
"syntax region luaCode matchgroup=Snip start=+<%+ end=+%>+ containedin=@HTML contains=@Lua

"hi link Snip SpecialComment
"let b:current_syntax = 'etlua'

if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif
syntax include @Lua syntax/lua.vim
syntax region luaEmbedded matchgroup=SpecialComment start=+<%+ end=+%>+ keepend containedin=@HTML contains=@Lua
if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
else
  unlet b:current_syntax
endif

