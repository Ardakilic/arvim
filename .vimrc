""""""""""""""""""""""""""""""""""
"     ___        _    ___
"    /   |  ____| |  / (_)___ ___
"   / /| | / ___/ | / / / __ `__ \
"  / ___ |/ /   | |/ / / / / / / /
" /_/  |_/_/    |___/_/_/ /_/ /_/
"
""""""""""""""""""""""""""""""""""

" URL: https://github.com/Ardakilic/arvim
" AUTHOR: Arda Kilicdagi
" WEB: http://arda.pw

set nocompatible              " be iMproved, required

"Vim breaks over SSH if language used in local and remote machines are different
"http://stackoverflow.com/q/17103551/570763
"http://stackoverflow.com/a/18929822/570763
set encoding=utf-8      "UTF-8 all the way!

" Let terminal get title from vim. Like "vim - fileName.php"
set title

set ruler " show cursor position at right bottom

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taken from spf13-vim
" Environment {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

" }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen bundle manager
" https://github.com/tpope/vim-pathogen 
execute pathogen#infect()
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <vundle> bundle manager
" https://github.com/gmarik/Vundle.vim
filetype off                  " required (will be enabled after vundle is set)
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""
""""Plugins here
" this command has to be run after bundles 'vim +BundleInstall +qall' once


"""ALL PLUGINS COME HERE


""" EXAMPLE PLUGIN
"Plugin 'bling/vim-airline'
"""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required (re-enablng filetype)
"""""plugins end
""""""""""

" </vundle> ends
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" ENABLING MOUSE
"
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
"""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""
""Now key edits + tricks

"""
"Easy escaping to normal model
imap jj <esc>
""""

""""
" Down is really the next line
nnoremap j gj
nnoremap k gk
""""

""""
""NeoComplCache + vim-multiple-cursors conflicts, a fix for it
" we've used a fork because of this: https://github.com/kris89/vim-multiple-cursors
" https://github.com/terryma/vim-multiple-cursors/issues/51#issuecomment-32344711
" let's use the methods here: https://github.com/Shougo/neocomplcache.vim/blob/master/doc/neocomplcache.txt#L106-L116
function! Multiple_cursors_before()
    exe 'NeoComplCacheLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoComplCacheUnlock'
    echo 'Enabled autocomplete'
endfunction
""""

""""
"""Auto left - right wrap
"If you are at the start of line and use left arrow, go to last character of previous line
" And if you are at the end of a line and use right arrow, go to start of the next line
" http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
set whichwrap+=<,>,h,l,[,]
""""

""""
" Force file type to be unix (for line endings)
if WINDOWS()
  set fileformat=unix
  set fileformats=unix,dos
endif
""""

""""
" Unhighlight search results with CTRL+o 
" So this way you can clean highlights in ease.
" http://stackoverflow.com/a/1037182/570763
map <C-o> :noh<CR>
""""


""""
" Mouse toggle (F12) (trimmed a bit for methods)
" https://github.com/nvie/vim-togglemouse/blob/master/plugin/toggle_mouse.vim
fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction
if !exists("no_plugin_maps") && !exists("no_toggle_mouse_maps")
    noremap <F12> :call <SID>ToggleMouse()<CR>
    inoremap <F12> <Esc>:call <SID>ToggleMouse()<CR>a
endif
""""

set backspace=indent,eol,start 
                    "Backspace fix for windows and some legacy unix/linux systems
set linespace=0     "Clears the space between lines, more compact
set nu              "Show line numbers as default
set showmatch       "Show matching parantheses (), {}, [] etc.
set hlsearch        "Highlight the matched search results
set incsearch       "Instantly show results when you start searching like /searchTerm
set ignorecase      "Default search is not case sensitive /searchresults
set smartcase       "If a uppercase character is entered, the search is now case sensitive /searchCase (the C character made it case sensitive) 
set visualbell      "Instead of beeping, shows a visual bell on errors

set nobackup        "No backup, vim!
set noswapfile      "No swap files


if !WINDOWS()
   set list             " whitespace highlight için
   set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespaces
                "If this line gives errors, it's most possibly from a UTF-8 setting misconfiguration on your side
                "You can change this into the following then:
                "set listchars=tab:>\ ,trail:.,extends:#,nbsp:. " Highlight problematic whitespaces
endif

""""
""<tab> Indents
" http://stackoverflow.com/a/23426067/570763
"set tabstop=4

set expandtab
set shiftwidth=4    "Use indents of 4 spaces
set softtabstop=4   "Let backspace delete indent
set smarttab        "Uses shiftwidth instead of tabstop at start of lines
""""

""""
"""Split settings
set splitright                  "Puts new vsplit windows to the right of the current
set splitbelow                  "Puts new split windows to the bottom of the current
""""

""""
" Tab and shift-tab inside editor
" This can also make selections tab and shift tab
map <Tab> >gv
map <S-Tab> <gv

" tap indent movement (use mark `m' for cursor position)
"http://stackoverflow.com/a/10174817/570763
"vmap <S-Tab>  mm<`m:<C-U>exec "normal ".&shiftwidth."h"<CR>mmgv`m
"vmap <Tab>    mm>`m:<C-U>exec "normal ".&shiftwidth."l"<CR>mmgv`m
"This is bugged in gvim insert mode, you can switch with the default active one
""""

"""""
"" Tab Navigation
"" {
map  <C-Right> :tabn<CR>    "Next tab with Ctrl+rightarrow
map  <C-Left> :tabp<CR>     "Previous tab with Ctrl+leftarrow
map  <C-n> :tabnew<CR>      "New tab with Ctrl+n 
"" }
"""""

""Solarized Theme {

""""
"""solarized theme:
" https://github.com/altercation/vim-colors-solarized
"syntax enable
"set background=dark
"colorscheme solarized

"airline temasını oturt
"solarized teması çikin duruyor, ondan başka tema ayarladım
"let g:airline_theme='solarized'
""solarized tema son
""""

""}

""xoria-256 Theme {
"set t_Co=256
"colorscheme xoria256
""xoria-256 tema son
""}

""Tomorrow-Night Theme {
set t_Co=256
colorscheme Tomorrow-Night
""Tomorrow-Night tema son
""}

""Better > and < icons for vim-airline, if there is no powerline fonts installed
if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
endif
""

""""
"leader key is ","
let mapleader=","
let g:mapleader = ","
""""

""""
" Paste toggle button
" http://stackoverflow.com/a/14330368/570763
:set pastetoggle=<F2>
""""

"""
" Select all shortcut
" Normal mode is needed for the command, because of that <esc> first
map <C-a> <esc>ggVG<CR>
""""


"""""" 
" Ctrl+X, Shift+Del, Ctrl+V, Shift+Insert

vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <S-Insert> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui


if has('clipboard')

    set clipboard+=unnamed

    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    endif

endif
""Paste stuff
""""

""""
" 3 left click will toggle the wrap
:map <3-LeftMouse> za
""""

""""
"Navigate / Switch between open buffers
map <F3> :bprevious<CR>
map <F4> :bnext<CR>
""""

""""
"Show line number shortcuts
map <F5> :set invnumber<CR>
map <F6> :set nu<CR>
map <F7> :set nonu<CR>
""""

""""
"Toggle the tagbar
nmap <F8> :TagbarToggle<CR>
"""""

""""
" Shift + Arrow keys for visual selection
" http://stackoverflow.com/a/22463664/570763
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
""""


"""""
" Copy current line with ctrl+shift+d (like in Sublime Text)
map <C-S-d> yyp<CR>
""""

"""""
" Open ConqueTerm (Split current buffer) with :T
:cabbrev T ConqueTermSplit bash
""""

"""""
" Open ConqueTerm (new buffer) with :Tn
:cabbrev Tn ConqueTerm bash
""""

""""
" NERDTree {
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeChDirMode=0

let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr'] " don't show these hidden files
let NERDTreeShowHidden=1 " Every hidden file except the top list should be listed
"let NERDTreeQuitOnOpen=1 " If a file is opened, hide NERDTree (disabled for now)
" }
""""

""""
" If NERDTREE is the last buffer, quit Vim
" To disable this, delete this code block
" {
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
" }
""""

""""
" Let CTRL+P should search current folder
" https://github.com/kien/ctrlp.vim#basic-options
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'c'

" some fixes taken from spf13-vim
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        " On Windows use "dir" as fallback command.
        if WINDOWS()
            let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
        elseif executable('ag')
            let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        elseif executable('ack')
            let s:ctrlp_fallback = 'ack %s --nocolor -f'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }
"""""

"set cursorline on startup
:set cursorline

"open neocomplcache
let g:neocomplcache_enable_at_startup = 1

""Remap vim-multiple-cursors to Ctrl+d
let g:multi_cursor_next_key='<C-d>'

"Neocomplcache should select / fill the nearest suggested method using <tab>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"""""""""""""""""""""""""""""""""""""
