" Last edited: Dec 26. 2016
" clone this repository to $HOME/.vim (OSX) or $HOME/vimfiles (Windows) and
" :PluginInstall

let isWindows=has("win32") || has("win64") 

"=======================Vundle settings=================================="
set nocompatible               " be iMproved
filetype off                   " required!

if isWindows 
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'

"============ NerdTree ============
" Open/Close    :NERDTreeToggle
" CheatSheet    https://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/
Plugin 'scrooloose/nerdtree'
if !isWindows
  "Does not support windows
  Plugin 'Xuyuanp/nerdtree-git-plugin'
endif
let NERDTreeShowHidden=1

"[count]<leader>c<space> |NERDComToggleComment|
Plugin 'The-NERD-Commenter'

" ====================

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup'
" Plugin 'tpope/vim-rails.git'
Plugin 'Raimondi/delimitMate'
Plugin 'snipMate'
Plugin 'taglist.vim'

"" Only for MAC
if !isWindows
  "Plugin 'Valloric/YouCompleteMe'
"   https://github.com/Valloric/YouCompleteMe#full-installation-guide
"
"   The way to compile 
"   cd ~/.vim/bundle/YouCompleteMe
"   ./install.py --clang-completer --omnisharp-completer --gocode-completer
"
  Plugin 'Command-T'
" cocoa
  Plugin 'b4winckler/vim-objc'
  Plugin 'cocoa.vim'
endif

" vim-scripts repos
Plugin 'L9'

""============ A.vim ============
" For C/C++, https://github.com/vim-scripts/a.vim
" :A switches to the header file corresponding to the current file being edited (or vise versa) 
" :AS splits and switches 
" :AV vertical splits and switches
Plugin 'a.vim'

"============ Lightline ============
" customization: https://github.com/itchyny/lightline.vim
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
"===================================

"============ MatchIt ============
"HTML/Latex TAG Matcher
Plugin 'matchit.zip' 
"===================================

call vundle#end()

"" ...
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

set encoding=utf-8 
set fileencoding=utf-8
set fileencodings=utf-8,euc-kr,cp949
set termencoding=utf-8

if has("gui_running")
  let applyColor=1
else
  set t_Co=256
  set background=dark
endif

" FOR WINDOWS 
if isWindows
  set langmenu=en_US.utf-8
  set gfn=Consolas:h10
  let $LANG = 'en_US.UTF-8'
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin

  if !empty($ConEmuBaseDir)
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    let applyColor=1
    nnoremap <Char-0x07F> <c-r>=Backspace()<CR>
    inoremap <Char-0x07f> <c-r>=Backspace()<CR>
    func! Backspace()
      if col('.') == 1     
	if line('.')  != 1       
		return  "\<ESC>kA\<Del>"     
	else       
		return ""     
	endif   
      else     
	return "\<Left>\<Del>"   
      endif 
    endfunc
  endif
else
  set gfn=Menlo:h12
endif

if applyColor
  color Monokai
endif

"set nocp
set number
set cursorline
set expandtab
set shiftwidth=2 "sw"
set tabstop=2 "ts"
set softtabstop=2 "sts"
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
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" ============ Tlist ================"

"if isWindows 
    "let Tlist_Ctags_Cmd="$HOME/vimfiles"
"endif
""let Tlist_Auto_Open = 1
""let Tlist_Auto_Highlight_Tag = 1
""let Tlist_Inc_Winwidth=0
""let Tlist_Exit_OnlyWindow = 1
""let Tlist_Process_File_Always = 1
""let Tlist_Compact_Format=1

"let Tlist_Display_Tag_Scope = 1        "태그범위를 표시
"let Tlist_Display_Prototype= 1            "함수원형을 표시
"let Tlist_Sort_Type = "name"            " 태그리스트를 소스코드위치가 아닌 이름 순서로 표시
"let Tlist_WinWidth = 35                     "태그리스트창의 폭을 35문자로 지정
"let Tlist_File_Fold_Auto_Close = 1

""set tags=./tags
""OpenCV tags
""TlistAddFiles *.cpp

"" ============ YouCompletMe ================"
"let g:ycm_path_to_python_interpreter = ''


augroup autoreload_vimrc " {{{
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }}}
