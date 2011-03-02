" NOTE: python's comment group should really be converted to a cluster to make
" it easier to mark up its contents.
syn match   pythonComment	"#.*$" contains=pythonTodo,vimModeline

syn match   pythonDecorator	"@" display contains=pythonDecoratorFunction nextgroup=pythonDecoratorFunction skipwhite
syn match   pythonDecoratorFunction	"[a-zA-Z_][a-zA-Z0-9_.]*" display contained nextgroup=pythonFunction skipwhite
hi link pythonDecoratorFunction pythonDecorator

syn clear pythonStatement
syn keyword pythonStatement	break continue del
syn keyword pythonStatement	except exec finally
syn keyword pythonStatement	pass print raise
syn keyword pythonStatement	return try with
syn keyword pythonStatement	global assert
syn keyword pythonStatement	lambda yield

syn match   pythonDefStatement	/^\s*\%(def\|class\)/
  \ nextgroup=pythonFunction skipwhite
syn region  pythonFunctionFold	start="^\z(\s*\)\%(def\|class\)\>"
  \ end="\ze\%(\s*\n\)\+\%(\z1\s\)\@!." fold transparent
syn match   pythonFunction	"[a-zA-Z_][a-zA-Z0-9_]*" contained
