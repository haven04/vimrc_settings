" Last edited: Dec 31. 2016
" Written by Jimin Jeon.
" clone this repository to $HOME/.vim (OSX) or $HOME/vimfiles (Windows) and
" :PluginInstall
"
" Ref: Errors on Windows git bash - https://github.com/VundleVim/Vundle.vim/wiki#e484-cant-open-file-cusersuseridappdatalocaltemp-error
"

let isWindows=has("win32") || has("win64")
let isMac=has("gui_macvim") || has("macunix") || has("mac")
let hasPythonSupport=has('python') || has('python3')

if isWindows
  let &shell='cmd.exe'
endif

"=======================Vundle settings=================================="
set nocompatible
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

" vim-scripts repos
Plugin 'L9'

"============ Fugitive.vim ============
Plugin 'tpope/vim-fugitive'
":Git, :Gstatus, :Gcommit, :Gbrowse, :Gread, :Ggrep, :Gmove..

"============ NerdTree ============
" Open/Close    :NERDTreeToggle
" CheatSheet    https://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/
Plugin 'scrooloose/nerdtree'
cabbrev ntt NERDTreeToggle
if !isWindows
  "Does not support windows
  Plugin 'Xuyuanp/nerdtree-git-plugin'
endif
let NERDTreeShowHidden=1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"============ NERDCommenter ============
"[count]<leader>c<space> |NERDComToggleComment|
"[count]<leader>cc |NERDComComment| Comment out the current line or text selected in visual mode.
"[count]<leader>cu |NERDComUncommentLine| Uncomments the selected line(s).
Plugin 'The-NERD-Commenter'
"map <A-/> <leader>c<space>
"if isWindows
"endif
"if isMac
  "map <A-/> <leader>c<space>
"endif

"============ Easymotion ============
" <leader><leader>wbjk
Plugin 'Lokaltog/vim-easymotion'

""============ A.vim ===========
" For C/C++, https://github.com/vim-scripts/a.vim
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
Plugin 'a.vim'

"============ vim-airline ============
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_type = 1
"let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_close_button = 0

set laststatus=2

"============ MatchIt ============
"HTML/Latex TAG Matcher
Plugin 'matchit.zip'

"============ Tagbar ================"
Plugin 'majutsushi/tagbar'

if isWindows
    let g:tagbar_ctags_bin='~/vimfiles/ctags.exe'
endif
cabbrev tt TagbarToggle

"============ Ultisnips ================"
if hasPythonSupport
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<tab>"
endif

"============ autoformat ================"
"Plugin 'Chiel92/vim-autoformat'

"============ CtrlP ================"
Plugin 'ctrlpvim/ctrlp.vim'
" :help ctrlp-mappings
" <c-f> and <c-b> to cycle between modes.
" <c-d> to switch to filename only search instead of full path.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.


"============ YouCompleteMe ================"
if hasPythonSupport
  Plugin 'Valloric/YouCompleteMe'
endif
"   https://github.com/Valloric/YouCompleteMe#full-installation-guide
"
"   The way to compile
"   cd ~/.vim/bundle/YouCompleteMe
"   ./install.py --all
"

"============ Delimitmate ================"
Plugin 'raimondi/delimitMate'

"============ Emmet ================"
" Trigger: <C-y>,
Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"" Only for MAC
if isMac
endif

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
map <space> <leader>
" for easymotion
map <space><space> <leader><leader>

set t_Co=256
"set background=dark

let isColorSupported = has("gui_running")
if isMac
  let isColorSupported = 1
  set gfn=Menlo\ For\ Powerline:h12
endif

if isWindows
  set langmenu=en_US.utf-8
  set gfn=Powerline\ Consolas:h10
  let $LANG = 'en_US.UTF-8'
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
endif

" FOR WINDOWS - bash
if !empty($ConEmuBaseDir)
  let isColorSupported = 1
  set termencoding=utf-8
  inoremap <Char-0x07f> <BS>
  nnoremap <Char-0x07F> <BS>

  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

  if isWindows
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
  endif

  if !isWindows
    "set term=xterm-256color
  endif

  "inoremap <Char-0x07f> <c-r>=Backspace()<CR>
  "nnoremap <Char-0x07F> <c-r>=Backspace()<CR>
  "func! Backspace()
    "if col('.') == 1
      "if line('.')  != 1
        "return  "\<ESC>kA\<Del>"
      "else
        "return ""
      "endif
    "else
      "return "\<Left>\<Del>"
    "endif
  "endfunc
endif

if isColorSupported
  color ZenBurn
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

"no bells
set noerrorbells
set vb t_vb=

"buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"" ============ YouCompletMe ================"
"let g:ycm_path_to_python_interpreter = ''


augroup autoreload_vimrc " {{{
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }}}
