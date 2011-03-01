" NOTE: python's comment group should really be converted to a cluster to make
" it easier to mark up its contents.
syn match   pythonComment	"#.*$" contains=pythonTodo,vimModeline

syn match   pythonDecorator	"@" display contains=pythonDecoratorFunction nextgroup=pythonDecoratorFunction skipwhite
syn match   pythonDecoratorFunction	"[a-zA-Z_][a-zA-Z0-9_.]*" display contained nextgroup=pythonFunc skipwhite
hi link pythonDecoratorFunction pythonDecorator
