""""""""""""""""""""""""""""""""""
"     ___        _    ___         
"    /   |  ____| |  / (_)___ ___ 
"   / /| | / ___/ | / / / __ `__ \
"  / ___ |/ /   | |/ / / / / / / /
" /_/  |_/_/    |___/_/_/ /_/ /_/ 
"
""""""""""""""""""""""""""""""""""""                                

" URL: https://github.com/Ardakilic/arvim
" AUTHOR: Arda Kilicdagi
" WEB: http://arda.pw


set nocompatible              " be iMproved, required

" terminal title'ı vim'den alsın. "vim - dosyaadi.php" gibi
set title

set ruler " sağ altta cursor position göster


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taken from spf13-vim
" Environment {

    " Identify platform {
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


" nerdtree eklendi: https://github.com/scrooloose/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle için
" https://github.com/gmarik/Vundle.vim
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""
""""pluginler buraya
"kurunca vim +BundleInstall +qall çalıştırılacak


"""pluginler buraya


"""
"airline plugini
"https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'
"""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required (sonradan yeniden açılmalı filetype)
"""""pluginler son
""""""""""

" vundle için son
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" FAREYİ AKTİF ETME
"
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""
""şimdi key editleri ve trickler

""otomatik left wrap, (satır başında sola basınca bir önceki, satır sonunda sağa basınca bir sonraki satıra geçme)
" http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
set whichwrap+=<,>,h,l,[,]


""""
" kaydedilen dosya tipini unix olmaya zorla (line endings)
if WINDOWS()
  set fileformat=unix
  set fileformats=unix,dos
endif
""""

""""
" Ctrl+o tuşuna basınca araya highlight kaldıran hackimsi. 
" böylece bir şey arandığında veya seçildiğinde escape'e basınca highlight kalkacak
" http://stackoverflow.com/a/1037182/570763
map <C-o> :noh<CR>
""""


""""
" Mouse toggle
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
                    "windows ve bazı antik linux sistemleri için backspace:
set linespace=0     "satırlar arası boşluk kalkyıor, daha kompakt
set nu              "satır sayısını aç
set showmatch       "eşleşen parantezleri ve süslü parantezleri göster
set hlsearch        "eşleşen armaa sonuçlarını highlight eder
set incsearch       "/arama gibi yazmaya başladığın anda gösterir eder
set ignorecase      " düz aramalar büyük küçük harfe bakmıyor
set smartcase       " Büyük harf girilmişse o zaman büyük küçük harfe bakıyor aramalar
set visualbell      "hatalarda bipbip ötmeye ek olarak görüntülü uyarı verir

set nobackup        " Vim kendi dosyaları backup almasın
set noswapfile      " Vim kendine bu backuplar için bir swap dosyası oluşturmasın.


if !WINDOWS()
   set list             " whitespace highlight için
   set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace " windows alerjik buna ondan böyle
endif

""""
""<tab>lar (girinti) ile alakalı
" http://stackoverflow.com/a/23426067/570763
"set tabstop=4

set expandtab
set shiftwidth=4    " Use indents of 4 spaces
set softtabstop=4   " Let backspace delete indent
set smarttab        "Uses shiftwidth instead of tabstop at start of lines
""""


set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

""""
" Editör içinde Tab ve shift-tab
" Selectionları da tab - shift tab yapabilir
map <Tab> >gv
map <S-Tab> <gv

" tap indent movement (use mark `m' for cursor position)
"http://stackoverflow.com/a/10174817/570763
"vmap <S-Tab>  mm<`m:<C-U>exec "normal ".&shiftwidth."h"<CR>mmgv`m
"vmap <Tab>    mm>`m:<C-U>exec "normal ".&shiftwidth."l"<CR>mmgv`m
"gvim'de insert moddayken buglı bu, tercihe göre açılabilir kapanabilir
"""

""""""
"" Tab Navigasyonu
"" {
map  <C-Right> :tabn<CR>    " Ctrl+sol ok ile tab sağa geçer
map  <C-Left> :tabp<CR>     " ctrl + sağok ile tab sağa geçer
map  <C-n> :tabnew<CR>      " ctrl+n yeni tab açar 
"" }
""""""

""Solarized Tema {

""""
"""solarized tema:
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

""xoria-256 Tema {
set t_Co=256
colorscheme xoria256
""xoria-256 tema son
""}

""Airline'da daha güzel < > ikonları, powerline fontları yoksa
if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
endif
""

""""
"leader keyini , işareti yapalım
let mapleader=","
""""

""""
" Paste toggle butonu
" http://stackoverflow.com/a/14330368/570763
:set pastetoggle=<F2>
""""

""""
" 3 left clickte fold toggle'ı
:map <3-LeftMouse> za
""""

""""
"açık bufferlar arasında switch
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
""""

""""
"satır sayısı gösterme
map <F5> :set invnumber<CR>
map <F6> :set nu<CR>
map <F7> :set nonu<CR>
"
""""

""""
"Tagbar ı aç kapa (F9)
nmap <F9> :TagbarToggle<CR>
"""""

"""""
" CTRL+Shift+d ile satırı kopyalama (Sublime Text'teki gibi)
map <C-S-d> yyp<CR>
""""

"""""
" :Ct komutu ile ConqueTermSplit açma (mevcut buffer splitlenerek terminal açılıyor)
:cabbrev T ConqueTermSplit bash
""""

"""""
" :Ctb komutu ile ConqueTerm açma (yeni bufferda terminal açılıyor)
:cabbrev Tn ConqueTerm bash
""""

""""
" NERDTree {
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeChDirMode=0

let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr'] " bu gizli dosyalar gözükmesin
let NERDTreeShowHidden=1 " yukardaki harici gizli dosyalar gözüksün
"let NERDTreeQuitOnOpen=1 " dosya açılırsa NERDtree kapansın, kapattım şimdilik
" }
""""

""""
" NERDTREE son buffer ise kendi de kapansın, bu sayede Vim de kapanır
" Bunu iptal etmek için bu kod bloğu kaldırılmalı
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
" CTRL+P vim'de mevcut klasöre baksın
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

"neocomplcache aç
let g:neocomplcache_enable_at_startup = 1

"neocomplcache vs. en yakın önerilen metodu tab tuşuna basarak doldursun
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"""""""""""""""""""""""""""""""""""""