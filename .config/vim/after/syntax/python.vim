" unlet b:current_syntax
" syn include @SQL syntax/sql.vim
" syn cluster SQL remove=sqlString,sqlComment

" syntax clear pythonString

" syn region  pythonString matchgroup=pythonQuotes
"       \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
"       \ contains=pythonEscape,@Spell,@SQL
" syn region  pythonString matchgroup=pythonTripleQuotes
"       \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
"       \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
" syn region  pythonRawString matchgroup=pythonQuotes
"       \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
"       \ contains=@Spell,@SQL
" syn region  pythonRawString matchgroup=pythonTripleQuotes
"       \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
"       \ contains=pythonSpaceError,pythonDoctest,@Spell

" let b:current_syntax='python'

syntax match PythonKwArg "\v[\(\,]\_s?\s{-}\zs\w+\ze\=(\=)@!"
syntax match PythonKwArg "\v^\s{-}\zs\w+\ze\=(\=)@!"

syn keyword PythonSelf self
syn keyword PythonCls cls

syn match PythonConstant /\<[A-Z_][A-Z_0-9]*\>/
syn match PythonDunder "__\w*__"

hi def link PythonSelf PreProc
hi def link PythonCls PreProc
hi def link PythonKwArg Special
hi def link PythonConstant Constant
hi def link PythonDunder PreProc
