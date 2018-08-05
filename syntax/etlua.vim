" Language:     etlua
" Maintainer:   VaiN474 (https://github.com/VaiN474)
" License:      MIT
" Last Change:  Aug 06 2018

if !exists("main_syntax")
  let main_syntax = 'html'
endif

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/html.vim

unlet b:current_syntax
syntax include @HTML syntax/html.vim

if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif
syntax include @Lua syntax/lua.vim
syntax region luaEmbedded matchgroup=SpecialComment start=+\(<%\)\(\s*end\)\@!+ end=+%>+ keepend containedin=@HTML contains=@Lua
syn region LuaOrphanEnd matchgroup=SpecialComment start=+\(<%\)\(\s*end\s*%>\)\@=+ end=+\(<%\s*end\s*\)\@<=\(%>\)+ keepend containedin=@HTML
hi def link LuaOrphanEnd	Statement
if exists('s:current_syntax')
  let b:current_syntax=s:current_syntax
else
  unlet b:current_syntax
endif

