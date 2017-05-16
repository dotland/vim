" Vim color file
" Maintainer:   Mingbai <mbbill AT gmail DOT com>

set background=dark
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let g:colors_name="code" " Modified candyman

" Under GUI
highlight Normal guifg=#D4D4D4 guibg=#1E1E1E gui=none
highlight Comment guifg=#888888 gui=italic

highlight Cursor guifg=black guibg=orange gui=none
highlight CursorLine guibg=#2E2E2E gui=none
highlight CursorColumn guibg=#2E2E2E gui=none
highlight ColorColumn guibg=#2E2E2E gui=none
highlight MatchParen guifg=#ffffff guibg=#80a090 gui=bold

highlight SignColumn guifg=#a0a8b0 guibg=#384048 gui=none
highlight FoldColumn guifg=#a0a8b0 guibg=#384048 gui=none
highlight Folded guifg=#a0a8b0 guibg=#384048 gui=italic

highlight IncSearch guifg=#b0ffff guibg=#2050d0
highlight LineNr guifg=#5A5A5A guibg=#252526 gui=none

highlight WarningMsg guifg=salmon gui=none
highlight ErrorMsg guibg=#902020 gui=none
highlight ModeMsg guifg=lightblue gui=bold
highlight MoreMsg guifg=lightblue gui=none
highlight NonText guifg=#808080 guibg=#151515 gui=none

highlight Pmenu guifg=#ffffff guibg=#262626 gui=none
highlight PmenuSel guifg=#101010 guibg=#eeeeee

highlight Question guifg=lightblue gui=none
highlight Search guifg=#f0a0c0 guibg=#302028 gui=underline
highlight SpecialKey guifg=#808080 guibg=#343434 gui=none

highlight StatusLine guifg=#f0f0f0 guibg=#393f47 gui=italic
highlight StatusLineNC guifg=#484848 guibg=#1a1f26 gui=italic
highlight VertSplit guifg=#393f47 guibg=#393f47 gui=italic
highlight Directory guifg=#dad085 gui=none

highlight Title guifg=#70b950 gui=bold
highlight Visual guibg=#503d50 gui=none
highlight WildMenu guifg=gray guibg=gray17 gui=none

highlight TabLine guifg=#262626 guibg=#b0b8c0 gui=italic
highlight TabLineFill guifg=#9098a0 gui=none
highlight TabLineSel guifg=#262626 gui=none

" syntax highlighting groups
highlight doxygenComment guifg=#888888 gui=none
highlight doxygenBrief guifg=#888888 gui=none
highlight doxygenBody guifg=#888888 gui=none
highlight doxygenParam guifg=#888888 gui=underline
highlight doxygenParamName guifg=#B5CEA8 gui=none
highlight doxygenBOther guifg=#888888 gui=bold,underline
highlight doxygenSpecialOnelineDesc guifg=#888888 gui=none
highlight doxygenPrev guifg=#888888 gui=none
highlight doxygenSpecialHeading guifg=#888888 gui=none
highlight doxygenSpecialTypeOnelineDesc guifg=#888888 gui=bold

highlight Constant guifg=#cf6a4c gui=none
highlight Number guifg=#B5CEA8 gui=none

highlight String guifg=#99ad6a gui=none
highlight StringDelimiter guifg=#556633 gui=none

highlight Identifier guifg=#c6b6ee gui=none
highlight Structure guifg=#79a5bf gui=none
highlight Function guifg=#dcdcaa gui=none
highlight Statement guifg=#8197bf gui=none
highlight PreProc guifg=#8fbfdc gui=none
highlight Test guifg=#8fbfdc gui=none
highlight Type guifg=#d8a465 gui=none
highlight Conditional guifg=#569CD6 gui=none
highlight Repeat guifg=#569CD6 gui=none
highlight Label guifg=#569CD6 gui=none
highlight Special guifg=#799d6a gui=none
highlight Delimiter guifg=#668799 gui=none
highlight Underlined guifg=#80a0ff gui=underline
highlight Ignore guifg=gray40 gui=none
highlight Error guibg=#902020 gui=none
highlight Todo guifg=#8a3c3b gui=bold
highlight StorageClass guifg=#c59f6f gui=none

hi link cppCast Statement
hi link Operator Statement

hi link diffRemoved Constant
hi link diffAdded String

highlight DiffAdd guibg=#032218 gui=none
highlight DiffChange guibg=#100920 gui=none
highlight DiffDelete guifg=#220000 guibg=#220000 gui=none
highlight DiffText guibg=#000940 gui=none


" PHP
hi link phpFunctions Function
hi link phpSuperglobal Identifier
hi link phpQuoteSingle StringDelimiter
hi link phpQuoteDouble StringDelimiter
hi link phpBoolean Constant
hi link phpNull Constant
hi link phpArrayPair Operator


" Ruby
hi link rubySharpBang Comment
highlight rubyClass guifg=#447799 gui=none
highlight rubyIdentifier guifg=#c6b6fe gui=none
highlight rubyInstanceVariable guifg=#c6b6fe gui=none
highlight rubySymbol guifg=#7697d6 gui=none

hi link rubyGlobalVariable rubyInstanceVariable
hi link rubyModule rubyClass
highlight rubyControl guifg=#7597c6 gui=none

hi link rubyString String
hi link rubyStringDelimiter StringDelimiter
hi link rubyInterpolationDelimiter Identifier

highlight rubyRegexpDelimiter guifg=#540063 gui=none
highlight rubyRegexp guifg=#dd0093 gui=none
highlight rubyRegexpSpecial guifg=#a40073 gui=none
highlight rubyPredefinedIdentifier guifg=#de5577 gui=none


" JavaScript
hi link javaScriptValue Constant
hi link javaScriptRegexpString rubyRegexp


" Objective-C/Cocoa
hi link objcClass Type
hi link cocoaClass objcClass
hi link objcSubclass objcClass
hi link objcSuperclass objcClass
hi link objcDirective rubyClass
hi link cocoaFunction Function
hi link objcMethodName Identifier
hi link objcMethodArg Normal
hi link objcMessageName Identifier


" Tag list
hi link TagListFileName Directory


if exists("g:code_statusLineColor")
	highlight User1 guifg=gray10 gui=bold guibg=#15bdfe
	highlight User2 guifg=gray85 gui=bold guibg=gray30
	highlight User3 guifg=gray10 gui=bold guibg=gray50
	highlight User4 guifg=gray10 gui=bold guibg=gray70
	highlight User5 guifg=gray10 gui=bold guibg=gray90
endif
	"highlight User1 guifg=gray10 gui=bold guibg=#eeb422
au InsertEnter * hi User1 guibg=#eeb422 ctermbg=214
au InsertLeave * hi User1 guibg=#15bdfe ctermbg=39

