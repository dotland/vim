" Vim syntax file
" Language:         Generic log files
" Maintainer:       Alex Dzyoba <avd@reduct.ru>
" Latest Revision:  2013-03-08
" Changes:          2013-03-08 Initial version

" Based on messages.vim - syntax file for highlighting kernel messages

if exists("b:current_syntax")
  finish
endif

syn region log_string   start=/'/  skip=/\\\('\|$\)/  end=/'\|$/ extend
syn region log_string   start=/"/  skip=/\\\("\|$\)/  end=/"\|$/ extend
syn region log_thread   start=/\[/ end=/\]/
syn match log_number    '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'
syn match log_version   'v\d*'
syn match logger        '\w*\s\-'

" This creates a match on the date and puts in the highlight group called logDate.  The
" nextgroup and skipwhite makes vim look for logTime after the match
syn match   log_date '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *' nextgroup=log_time skipwhite
syn match   log_date /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=log_time skipwhite

" This creates a match on the time (but only if it follows the date)
syn match log_time /\d\{2}:\d\{2}:\d\{2}.\d\{3}/

syn match trace "\sTRACE\s"
syn match debug "\sDEBUG\s"
syn match info "\sINFO\s"
syn match warn "\sWARN\s"
syn match error "\sERROR\s"
syn match fatal "\sFATAL\s"

hi trace ctermfg=Black ctermbg=LightBlue guifg=Black guibg=#569CD6 cterm=bold gui=bold
hi debug ctermfg=Black ctermbg=Gray guifg=Black guibg=#b0b8c0 cterm=bold gui=bold
hi info ctermfg=Black ctermbg=LightGreen guifg=Black guibg=#70b950 cterm=bold gui=bold
hi warn ctermfg=Black ctermbg=Yellow guifg=Black guibg=#eeb422 cterm=bold gui=bold
hi error ctermfg=White ctermbg=Red guifg=White guibg=#902020 cterm=bold gui=bold
hi fatal ctermfg=Red ctermbg=Yellow guifg=Red guibg=Yellow cterm=bold gui=bold

hi link log_string      String
hi link log_number      Number
hi link log_version      Number
hi link log_date        Constant
hi link log_time        Type
hi link log_thread      Structure
hi link logger          Identifier

let b:current_syntax = "log4j"
