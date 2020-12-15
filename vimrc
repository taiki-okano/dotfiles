" User settings
syntax enable
set visualbell
set autoread
set fenc=utf-8
set smartcase
set hlsearch
set wrapscan
set ignorecase
set ruler
set number
set wildmenu
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set clipboard^=unnamed
set t_Co=256
set backspace=indent,eol,start
highlight Search ctermbg=Cyan
highlight Search ctermfg=Black

" Clipboard
if has('clipboard')
  set clipboard=unnamed,unnamedplus,autoselect
endif

" Bind space to user keybinds
nnoremap <Space>h :nohlsearch<Enter>

" GUI Font
if has('gui_running')
  set guifont="Source Code Pro for Powerline:h11"
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.dein_plugin.toml', {'lazy': 0})
  call dein#load_toml('~/.dein_plugin_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
