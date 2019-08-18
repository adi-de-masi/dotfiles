"" General
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set expandtab
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
 
set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" configuration for Powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" not sure what these do
set ttymouse=xterm2
behave xterm
let @q='1GVG"*y'
" end not sure

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_javascript_checkers = ['eslint']

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let mapleader = ","

nmap <leader>y :PBCopy<cr>
nmap <leader>h :nohlsearch<cr>
nmap <leader>n :set number!<cr>
nmap <leader>r :NERDTreeToggle<cr>
nmap <leader>t :NERDTreeFind<cr>
nmap <leader>X :%!xmllint --format -<cr>
nmap <leader>x :%!python -m json.tool<cr>
nmap <leader><Tab> :bn<cr>
nmap <leader><S-Tab> :bp<cr>
nmap <leader>s :w<cr>
"" Plugins
" Use vim-plug. https://github.com/junegunn/vim-plug
" Install if not already there:
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Usage
"Add a vim-plug section to your ~/.vimrc (or ~/.config/nvim/init.vim for Neovim):
"1. Begin the section with call plug#begin()
"2. List the plugins with Plug commands
"3. call plug#end() to update &runtimepath and initialize plugin system
"   Automatically executes filetype plugin indent on and syntax enable. You can revert the settings after the call. e.g. filetype indent off, syntax off, etc.
"4.  Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree'
" Shorthand notation; fetches https://github.com/scrooloose/syntastic
Plug 'vim-syntastic/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'schickling/vim-bufonly'
Plug 'ahw/vim-pbcopy'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Lokaltog/powerline'

" Initialize plugin system
call plug#end()
