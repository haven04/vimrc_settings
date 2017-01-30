" Last edited: Jan 10. 2017
" Written by Jimin Jeon.
" clone this repository to $HOME/.vim (OSX) or $HOME/vimfiles (Windows) and
" :PluginInstall
"
" Ref: Errors on Windows git bash - https://github.com/VundleVim/Vundle.vim/wiki#e484-cant-open-file-cusersuseridappdatalocaltemp-error
"

let isWindows=has("win32") || has("win64")
let isMac=has("gui_macvim") || has("macunix") || has("mac")
let hasPythonSupport=has('python') || has('python3')
let $VIMHOME = '~/.vim'

if isWindows
  let $VIMHOME = '~/vimfiles'
  let &shell='cmd.exe'
  set shellslash
endif

"=======================Vundle settings=================================="
set nocompatible
filetype off " required!

set rtp+=$VIMHOME/bundle/Vundle.vim/
let path = $VIMHOME.'/bundle'
call vundle#begin(path)

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'

" vim-scripts repos
Plugin 'L9'

"============ Fugitive.vim ============
Plugin 'tpope/vim-fugitive'
set diffopt+=vertical
":Git, :Gstatus, :Gcommit, :Gbrowse, :Gread, :Ggrep, :Gmove..

"============ vim-signify ============
Plugin 'mhinz/vim-signify'

let g:signify_vcs_list              = [ 'git', 'hg' ]
let g:signify_cursorhold_insert     = 1
let g:signify_cursorhold_normal     = 1
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 1
set updatetime=1000

"============ vim-indent-guides ============
Plugin 'nathanaelkane/vim-indent-guides'

"============ NerdTree ============
" Open/Close    :NERDTreeToggle
" CheatSheet    https://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/
Plugin 'scrooloose/nerdtree'
cabbrev ntt NERDTreeToggle
Plugin 'Xuyuanp/nerdtree-git-plugin'
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
  let g:tagbar_ctags_bin=$VIMHOME.'/ctags.exe'
endif
cabbrev tt TagbarToggle

"=========== Bufferline ================"
Plugin 'bling/vim-bufferline'

"============ Ultisnips ================"
if hasPythonSupport
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

"============ autoformat ================"
"Plugin 'Chiel92/vim-autoformat'

"============ CtrlP ================"
Plugin 'ctrlpvim/ctrlp.vim'
" :help ctrlp-mappings
" <c-f> and <c-b> to cycle between modes.
" <c-d> to switch to filename only search instead of full path.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.

"============ SuperTab ================"
Plugin 'ervandew/supertab'

"============ YouCompleteMe ================"
if hasPythonSupport
  Plugin 'Valloric/YouCompleteMe'

  let g:ycm_global_ycm_extra_conf = $VIMHOME.'/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
  let g:ycm_python_binary_path = 'python'
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-n>'
endif
"   https://github.com/Valloric/YouCompleteMe
"   https://github.com/rdnetto/YCM-Generator
"
"   The way to compile
"   cd ~/.vim/bundle/YouCompleteMe
"   ./install.py --all
"

"============ Ack.vim ================"
Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
noremap <Leader>a :Ack! <cword><cr>

":Ack [options] {pattern} [{directories}]}
"?    a quick summary of these keys, repeat to close
"o    to open (same as Enter)
"O    to open and close the quickfix window
"go   to preview file, open but maintain focus on ack.vim results
"t    to open in new tab
"T    to open in new tab without moving to it
"h    to open in horizontal split
"H    to open in horizontal split, keeping focus on the results
"v    to open in vertical split
"gv   to open in vertical split, keeping focus on the results
"q    to close the quickfix window

"============ Vim-Better-Whitespace ================"
Plugin 'ntpeters/vim-better-whitespace'

"============ Delimitmate ================"
"Automatic closing of parenthesis, quotes and brackets
Plugin 'raimondi/delimitMate'

"============ Emmet ================"
" Trigger: <C-y>,
Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"============ Markdown ================"
Plugin 'tpope/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c', 'cpp']

Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_slow = 1
"Install - https://github.com/suan/vim-instant-markdown 


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

syntax on
filetype plugin on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-kr,cp949
map <space> <leader>
"for easymotion
map <space><space> <leader><leader>

set t_Co=256
"set background=dark

let isColorSupported = has("gui_running") || $TERM=='xterm-256color'

if isMac
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
  set termencoding=utf-8
  inoremap <Char-0x07f> <BS>
  nnoremap <Char-0x07F> <BS>

  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

  "Cmd
  if isWindows
    let isColorSupported = 1
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
  endif

  "tmux
  if !empty($TMUX)
    let isColorSupported = 1
  endif
endif

if isColorSupported
  color zenburn
endif

set list
"set listchars=tab:▸\ ,space:·,trail:·,nbsp:·,eol:¬
set listchars=tab:▸\ ,space:·,nbsp:·,eol:¬
hi clear SpecialKey
hi! link SpecialKey NonText

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

"set background color to columns over 120
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

set noimd
set iminsert=1
set imsearch=-1

"no bells
set noerrorbells
set vb t_vb=

"buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>

"" ============ YouCompletMe ================"
"let g:ycm_path_to_python_interpreter = ''


augroup autoreload_vimrc " {{{
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }}}

