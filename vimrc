" Last edited: Dec 28. 2016
" Written by Jimin Jeon.
" clone this repository to $HOME/.vim (OSX) or $HOME/vimfiles (Windows) and
" :PluginInstall
"
" Ref: Errors on Windows git bash - https://github.com/VundleVim/Vundle.vim/wiki#e484-cant-open-file-cusersuseridappdatalocaltemp-error
"

let isWindows=has("win32") || has("win64")
if isWindows
  let &shell='cmd.exe'
endif

let isMac=has("gui_macvim") || has("macunix") || has("mac")

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

"============ NerdTree ============
" Open/Close    :NERDTreeToggle
" CheatSheet    https://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/
Plugin 'scrooloose/nerdtree'
cabbrev ntt NERDTreeToggle
map <silent> <C-k>b :NERDTreeToggle<CR>
if !isWindows
  "Does not support windows
  Plugin 'Xuyuanp/nerdtree-git-plugin'
endif
let NERDTreeShowHidden=1

"============ NERDCommenter ============
"[count]<leader>c<space> |NERDComToggleComment|
"[count]<leader>cc |NERDComComment| Comment out the current line or text selected in visual mode.
"[count]<leader>cu |NERDComUncommentLine| Uncomments the selected line(s).
Plugin 'The-NERD-Commenter'
if isWindows
  map <A-/> <leader>c<space>
endif
"if isMac
  "map <T-/> <leader>c<space>
"endif

"============ Fugitive.vim ============
Plugin 'tpope/vim-fugitive'
":Git, :Gstatus, :Gcommit, :Gbrowse, :Gread, :Ggrep, :Gmove..

"============ Easymotion ============
" <leader><leader>wbjk
Plugin 'Lokaltog/vim-easymotion'

""============ A.vim ============
" For C/C++, https://github.com/vim-scripts/a.vim
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
Plugin 'a.vim'

"============ vim-airline ============
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='molokai'
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
if has('python')
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
endif

"============ Delimitmate ================"
Plugin 'raimondi/delimitMate'

"============ Sparkup ================"
if has('python')
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
endif

"" Only for MAC
if isMac
  "Plugin 'Valloric/YouCompleteMe'
"   https://github.com/Valloric/YouCompleteMe#full-installation-guide
"
"   The way to compile
"   cd ~/.vim/bundle/YouCompleteMe
"   ./install.py --clang-completer --omnisharp-completer --gocode-completer
" cocoa
  Plugin 'b4winckler/vim-objc'
  Plugin 'cocoa.vim'
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

let isColorSchemeAvailable=0
if has("gui_running")
  let isColorSchemeAvailable=1
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
    let isColorSchemeAvailable=1
    nnoremap <Char-0x07F> <c-r>=Backspace()<CR>
    inoremap <Char-0x07f> <c-r>=Backspace()<CR>
    set termencoding=utf-8

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

if isColorSchemeAvailable
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


"" ============ YouCompletMe ================"
"let g:ycm_path_to_python_interpreter = ''


augroup autoreload_vimrc " {{{
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }}}
