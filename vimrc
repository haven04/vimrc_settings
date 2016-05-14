" Last edited: May 15. 2016
" put this file under $HOME/.vim (OSX) or $HOME/vimfiles (Windows)
"
" "===
" Vundle install
" (For Mac)
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" (For windows)
" cd %USERPROFILE%
" git clone https://github.com/VundleVim/Vundle.vim.git vimfiles/bundle/Vundle.vim
" gvim _vimrc
"
"=======================Vundle settings=================================="

set nocompatible               " be iMproved
filetype off                   " required!

let isWindows=has("win32") || has("win64") 

if isWindows 
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

 " let Vundle manage Vundle
 " required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'

 " original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup'
" Plugin 'tpope/vim-rails.git'
Plugin 'Raimondi/delimitMate'

Plugin 'snipMate'
Plugin 'taglist.vim'


" Only for MAC
if !isWindows
    Plugin 'Valloric/YouCompleteMe'
"   https://github.com/Valloric/YouCompleteMe#full-installation-guide
"
"   The way to compile 
"   cd ~/.vim/bundle/YouCompleteMe
"   ./install.py --clang-completer --omnisharp-completer --gocode-completer
" cocoa
    Plugin 'b4winckler/vim-objc'
    Plugin 'cocoa.vim'
endif

Plugin 'a.vim'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

Plugin 'flazz/vim-colorschemes'
Plugin 'Solarized'

"HTML TAG Matcher
Plugin 'matchit.zip' 

" non github repos
Plugin 'Command-T'

"Syntastic
Plugin 'Syntastic'

call vundle#end()

" ...
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

"======================================================================="

set background=dark
color Monokai
set encoding=utf-8 
set fileencoding=utf-8
set fileencodings=utf-8,euc-kr,cp949

" FOR WINDOWS 
if isWindows
    set langmenu=en_US.utf-8
    set gfn=Consolas:h10
    let $LANG = 'en_US.UTF-8'
    set rtp+=$HOME/.vim/bundle/
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
else
    set gfn=Menlo:h12
endif
"

"set nocp
set number
set cursorline
set expandtab
set sw=4
set ts=4
set sts=4
"set nowrap
set smartindent

set hlsearch
set ignorecase
set smartcase
set showmatch

set foldmethod=marker

syntax on
filetype plugin on

set noimd
set iminsert=1
set imsearch=-1

" let filetype_m='objc'
" let filetype_mm='objc'
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" ============ Tlist ================"

if isWindows 
    let Tlist_Ctags_Cmd="$HOME/vimfiles"
endif
"let Tlist_Auto_Open = 1
"let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Inc_Winwidth=0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Process_File_Always = 1
"let Tlist_Compact_Format=1

let Tlist_Display_Tag_Scope = 1        "태그범위를 표시
let Tlist_Display_Prototype= 1            "함수원형을 표시
let Tlist_Sort_Type = "name"            " 태그리스트를 소스코드위치가 아닌 이름 순서로 표시
let Tlist_WinWidth = 35                     "태그리스트창의 폭을 35문자로 지정
let Tlist_File_Fold_Auto_Close = 1

"set tags=./tags
"OpenCV tags
"TlistAddFiles *.cpp

"============ NerdTree ============
let NERDTreeShowHidden=1

"============ Processing Build ============
"command Prorun execute 
"!processing-java --sketch=%:p:h --output=~/Documents/tmp/ --force --run"

"Autorelad .vimrc
"augroup reload_vimrc " {
""    autocmd!
""    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }

" ============ YouCompletMe ================"
let g:ycm_path_to_python_interpreter = ''


