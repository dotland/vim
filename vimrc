"
" Custom .vimrc file
"
" This is in the public domain, so feel free to use / change / redistribute it
" You can check the complete repository at http://github.com/motanelu/vim-configuration
"
" Author: Tudor Barbu <hello@tudorbarbu.ninja>
" Blog: http://tudorbarbu.ninja
" License: LGPL
""

" {{{ Vundle config
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'

    source ~/.vim/vundle-plugins

    call vundle#end()
    filetype plugin indent on
" }}}

" turn syntax dection on
syntax on

" Generic config
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set nobackup                    " no backup - use git like a normal person
set noswapfile                  " no swap file
set splitbelow                  " horizontal windows always split below
set splitright                  " vertical windows always split right
set completeopt-=preview        " auto complete menu
set title                       " show window title
set autoindent                  " autoindent when pressing Enter
set background=dark             " use a dark scheme
set tabstop=4                   " use 4 spaces for tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set incsearch
set ignorecase
set smartcase
set ls=2
set ruler
set nowrap
set hidden
set showtabline=2
set formatoptions=qroct
set shell=/bin/bash
set complete=.,w,b,u,t,i,kspell
set vb                          " kill sounds
set showcmd
set mouse=a                     " allow mouse usage for all modes (a)
set spelllang=en_us             " current language
set cursorline                  " highlight the current line
set fileformat=unix             " unix file format by default
set fileformats=unix,dos,mac    " available formats
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

colorscheme code

" Put colorscheme at the end of the file as CSApprox conflicts with easymotion
" 256 colors at terminal
set t_Co=256

set list                        " Show problematic spaces
if has('gui_running')
    set listchars=tab:»\ ,trail:•,nbsp:.,extends:❯,precedes:❮
else
    set listchars=tab:>.,trail:~,nbsp:.,extends:>,precedes:<
endif

if !has("mac")
    inoremap <C-BS> <C-w>
endif
" else use Alt + delete

if version >= 703
    set relativenumber
endif

" Save to system's clipboard macos vs linux clipboard
if version >= 703 && has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=1000
set undolevels=100


" Remap the leader to something more comfortable
let mapleader=","

" Tagbar
let g:tagbar_left = 0
let g:tagbar_sort = 0

" FOLDING
map <Leader>- zc
map <Leader>= zo
map <Leader>9 zM
map <Leader>0 zR

" QUICK COMMANDLINE
noremap <CR> :

" SPELLING
" ]s - next misspelled word
" [s - previous misspelled word
" z= - suggest alternatives
" zg - add to the dictionary
" zw - mark word as incorrect
set spell spelllang=en_us
set nospell
noremap <silent><C-s> :set spell! spell?<CR>

if has('gui_running')
    set foldlevel=99
endif

" Right click menu
:set mousemodel=popup

" TOGGLE SEARCH HIGHLIGHTS
nnoremap hl :set hlsearch! hlsearch?<CR>

" UPPERCASE WHOLE LINE
map <Leader>u <Esc>0gU$$

" disable toolbar at gui mode
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
set guioptions+=b  "add bottom scroll bar
set guioptions-=L  "remove Taglist scroll bar

"" NERDTree
if has('gui_running')
    nmap <leader>n :NERDTreeToggle<CR>:set columns=180<CR>
else
    nmap <leader>n :NERDTreeToggle<CR>
endif

" Set the window width
let NERDTreeWinSize = 40
" Set the window position
let NERDTreeWinPos = "left"
" Auto centre
let NERDTreeAutoCenter = 0
" Not Highlight the cursor line
let NERDTreeHighlightCursorline = 0


"" gundo tree
if version >= 703
    let g:gundo_width = 60
    let g:gundo_preview_height = 40
    let g:gundo_right = 1
    nnoremap <F5> :GundoToggle<CR>
endif

" visual reselect of just pasted
nnoremap gp `[v`]

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" ctrlP config
let g:ctrlp_map = "<c-p>"
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

nnoremap <leader>; :CtrlPMRU<CR>
nnoremap <Leader><Space> :CtrlP<cr>
nnoremap <Leader>' :CtrlPBuffer<cr>

" easy motion rebinded
nmap <leader>f <Plug>(easymotion-f2)
nmap <leader>F <Plug>(easymotion-F2)

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"

"map next-previous jumps
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" Use sane regexes
nnoremap <leader>/ /\v
vnoremap <leader>/ /\v

" Use :Subvert search
nnoremap <leader>// :S /
vnoremap <leader>// :S /

" Use regular replace
nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

" Use :Subvert replace
nnoremap <leader>S :%S /
vnoremap <leader>S :%S /

if version >= 703
    set colorcolumn=100
else
    :2mat ErrorMsg '\%81v.'
endif


" airline
set laststatus=2

if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" git and ack stuff
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>G mG:Git!
nnoremap <leader>g :Git
nnoremap <leader>A :!ag
nnoremap <leader>a :Ag!

" Doxygen
let g:doxygen_enhanced_colour = 1

" enable angular syntax
let g:used_javascript_libs = 'jquery,angularjs'

if has('gui_running')
    if has("mac")
        set guifont=Inconsolata\ for\ Powerline:h14 " ~/.local/share/fonts
    else
        set guifont=Inconsolata\ for\ Powerline\ 12 " ~/.local/share/fonts
    endif

    if &diff
        set lines=57   " set height of workspace in lines.
        let &columns = 198 + 2 * &foldcolumn + 1
    else
        set lines=53   " set height of workspace in lines.
        set columns=140 " set width of workspace in columns.
    endif

    nnoremap <F12> :TagbarToggle<CR>:set columns=180<CR>
else
    nnoremap <F12> :TagbarToggle<CR>
endif

nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" clang formatter
let g:clang_format#style_options= {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \ "BreakConstructorInitializersBeforeComma" : "true",
            \ "BreakBeforeBinaryOperators" : "true",
            \ "ExperimentalAutoDetectBinPacking" : "true",
            \ "IndentCaseLabels" : "false",
            \ "ColumnLimit" : 84,
            \ "IndentWidth" : 4,
            \ "TabWidth" : 4,
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

autocmd FileType c,cpp,objc nnoremap <buffer><C-f> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><C-f> :ClangFormat<CR>

""""""""""""""""""""""""""""""""
" COOL HACKS
""""""""""""""""""""""""""""""""
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" better retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

" {{{ File configuration
    " Detect file types
    autocmd BufRead,BufNewFile *httpd*.conf setfiletype apache "Apache config files
    autocmd BufRead,BufNewFile .htaccess    setfiletype apache "htaccess files
    autocmd BufRead,BufNewFile *inc         setfiletype php "PHP include files
    autocmd BufRead,BufNewFile *handlebars  setfiletype html "handlebars templates
    autocmd BufRead,BufNewFile *.out,*.out.*,*.log,*.log.*  set ft=log4j syntax=log4j
    autocmd BufRead,BufNewFile *access.log* setf httplog

    " better autochdir
    autocmd BufEnter * silent! lcd %:p:h

    autocmd FileType python     set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS noci
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType crontab    setlocal nobackup nowritebackup

    " StriTrailingWhitespace - taken from http://spf13.com
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

    " Remove whitespace on write
    autocmd BufWritePre * call StripTrailingWhitespace()

    au FileType javascript setl sw=2 sts=2 et
    au FileType html setl sw=2 sts=2 et
" }}}

" {{{ Utility mappings
    " Avoid typos
    noremap :W :w
    noremap :Q :q

    " Yank 'till the end of the line
    nnoremap Y y$

    " Find merge conflict marker
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " need sudo?
    cmap w!! w !sudo tee % >/dev/null

    nmap <leader>t :TagbarToggle<CR>     " toggle tagbar - Plugin: majutsushi/tagbar
    nmap <leader>r :UndotreeToggle<cr>   " toggle undotree - Plugin: mbbill/undotree

    " select last pasted text
    nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

    " spellcheck toggle (on/off)
    nmap <silent> <leader>s :set spell!<CR>

    " CTRL + hjkl to move between windows
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " using tabs
    noremap tn :tabnew<cr>      " tn to open a new tab
    noremap tc :tabclose<cr>    " tc to close the current tab
    noremap ¬ :tabnext<cr>      " ALT + l next tab
    noremap ˙ :tabprevious<cr>  " ALT + h previous tab
    noremap to :tabonly<cr>     " close all other tabs

    inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

    " go back after a gf
    noremap gb <C-o>
" }}}

" {{{ Plugin configurations
    " {{{ ctrlpvim/ctrlp.vim
        let g:ctrlp_working_path_mode = 'ra'
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    " }}}

    " {{{ tacahiroy/ctrlp-funky
        let g:ctrlp_extensions = ['funky']
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    " }}}

    " {{{ kien/rainbow_parentheses.vim
        "let g:rbpt_colorpairs = [
        "    \ ['blue',         '#FF6000'],
        "    \ ['cyan',         '#00FFFF'],
        "    \ ['darkmagenta',  '#CC00FF'],
        "    \ ['yellow',       '#FFFF00'],
        "    \ ['red',          '#FF0000'],
        "    \ ['darkgreen',    '#00FF00'],
        "    \ ['White',        '#c0c0c0'],
        "    \ ['blue',         '#FF6000'],
        "    \ ['cyan',         '#00FFFF'],
        "    \ ['darkmagenta',  '#CC00FF'],
        "    \ ['yellow',       '#FFFF00'],
        "    \ ['red',          '#FF0000'],
        "    \ ['darkgreen',    '#00FF00'],
        "    \ ['White',        '#c0c0c0'],
        "    \ ['blue',         '#FF6000'],
        "    \ ['cyan',         '#00FFFF'],
        "    \ ['darkmagenta',  '#CC00FF'],
        "    \ ['yellow',       '#FFFF00'],
        "    \ ['red',          '#FF0000'],
        "    \ ['darkgreen',    '#00FF00'],
        "    \ ['White',        '#c0c0c0'],
        "\ ]
        "au VimEnter * RainbowParenthesesToggle
        "au Syntax * RainbowParenthesesLoadRound
        "au Syntax * RainbowParenthesesLoadSquare
        "au Syntax * RainbowParenthesesLoadBraces
    " }}}

    " {{{ godlygeek/tabular
        nmap <Leader>a=  :Tabularize /=<CR>
        vmap <Leader>a=  :Tabularize /=<CR>
        nmap <Leader>a=> :Tabularize /=><CR>
        vmap <Leader>a=> :Tabularize /=><CR>
        nmap <Leader>a:  :Tabularize /:<CR>
        vmap <Leader>a:  :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
    " }}}

    " {{{ SirVer/ultisnips
    "    let g:UltiSnipsExpandTrigger       = "<C-l>"
    "    let g:UltiSnipsJumpForwardTrigger  = "<C-l>"
    "    let g:UltiSnipsJumpBackwardTrigger = "<C-z>"
    "    let g:UltiSnipsEditSplit           = "vertical"
    " }}}

    " {{{ joonty/vdebug
        let g:vdebug_keymap = {
            \    "run"            : "<Leader>'",
            \    "run_to_cursor"  : "<Leader><Down>",
            \    "step_over"      : "<Leader><Up>",
            \    "step_into"      : "<Leader><Left>",
            \    "step_out"       : "<Leader><Right>",
            \    "close"          : "q",
            \    "detach"         : "x",
            \    "eval_visual"    : "<Leader>e",
            \    "sspellchcket_breakpoint" : "<Leader>p"
        \}

        let g:vdebug_options = {
            \    "break_on_open" : 0,
        \}
    " }}}

    " {{{ dhruvasagar/vim-table-mode
        let g:table_mode_corner_corner   = "+"
        let g:table_mode_header_fillchar = "="
    " }}}

    " {{{ scrooloose/syntastic
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list            = 0
        let g:syntastic_check_on_wq              = 0
        let g:syntastic_check_on_open            = 0
        let g:syntastic_javascript_checkers      = ['standard']
    " }}}

    " {{{ ternjs/tern_for_vim
        let g:tern_show_argument_hints='on_hold'
        let g:tern_map_keys = 1
    " }}}

    " {{{ Lokaltog/vim-easymotion
        hi link EasyMotionTarget ErrorMsg
        hi link EasyMotionShade  Comment
    " }}}

    " {{{ 1995eaton/vim-better-javascript-completion
        let g:vimjs#smartcomplete = 1
    " }}}

    let g:airline_powerline_fonts = 1   " bling/vim-airline
    let g:move_key_modifier = 'C'       " matze/vim-move
" }}}

" {{{ PHP Configuration
"    " PHP specials (next/previous variable)
"    noremap L f$
"    noremap H F$
"
"    " PHP complete
"    let g:phpcomplete_parse_docblock_comments = 1
"    let g:phpcomplete_index_composer_command = '/usr/local/bin/composer'
"
"    " php documentor
"    inoremap <C-o> <ESC>:call PhpDocSingle()<CR>i
"    nnoremap <C-o> :call PhpDocSingle()<CR>
"    vnoremap <C-o> :call PhpDocRange()<CR>
"
"    " configure tagbar to not show variables
"    let g:tagbar_type_php  = {
"        \ 'ctagstype' : 'php',
"        \ 'kinds'     : [
"            \ 'n:namespaces',
"            \ 'i:interfaces',
"            \ 'c:classes',
"            \ 'd:constant definitions',
"            \ 'f:functions'
"        \ ]
"    \ }
"
"    let g:syntastic_php_checkers   = ['php', 'phpcs']        " do not run phpmd
"    let g:syntastic_php_phpcs_args = '-s -n --standard=PSR2' " always check against PSR2
"
"    " php code fixer
"    let g:php_cs_fixer_level    = "symfony"  " which level ?
"    let g:php_cs_fixer_config   = "default"  " configuration
"    let g:php_cs_fixer_php_path = "php"      " Path to PHP
"    let g:php_cs_fixer_verbose  = 1          " Return the output of
"    let g:php_cs_fixer_enable_default_mapping = 1       " <leader>pcf
"
"    let g:ycm_semantic_triggers = {}
"    let g:ycm_semantic_triggers.php =
"    \ ['->', '::', '(', 'use ', 'namespace ', '\']
"
"    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" }}}
