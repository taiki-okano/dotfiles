" User settings
syntax enable
set fenc=utf-8
set smartcase
set hlsearch
set ignorecase
set ruler
set number
set wildmenu
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set t_Co=256
set backspace=indent,eol,start
set expandtab

" Change tabstop and shiftwidth for specific formats
autocmd Filetype html set shiftwidth=2
autocmd Filetype html set tabstop=2
autocmd Filetype css set shiftwidth=2
autocmd Filetype css set tabstop=2

" Clipboard
if has('clipboard')
  set clipboard=unnamed,unnamedplus,autoselect
endif

" Bind space to user keybinds
nnoremap <Space>h :nohlsearch<Enter>
nnoremap <Space>% :vs<Enter>
nnoremap <Space>" :sp<Enter>
nnoremap <Space>w <C-w>w

" Delete unnecessary spaces when saving
autocmd BufWritePost * :%s/\s\+$//e

" --Vundle settings begin--
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Hybrid theme (further settings are below)
Plugin 'w0ng/vim-hybrid'

" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" ALE (lint tool)
Plugin 'w0rp/ale'
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" fugitive (git tool)
Plugin 'tpope/vim-fugitive'

" markdown highlight
Plugin 'gabrielelana/vim-markdown'

" PEP8 Indent for Python
Plugin 'Vimjas/vim-python-pep8-indent'

" vim-lsp
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
let g:lsp_diagnostics_enabled = 0

" asynccomplete
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

call vundle#end()
filetype plugin indent on
" --Vundle settings end--

" Set the theme
set background=dark
colorscheme hybrid
