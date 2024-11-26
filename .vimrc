set nocompatible
syntax enable
set ignorecase
set ruler
set number
set wildmenu
set smartindent
set shiftwidth=4
set tabstop=4
set mouse=a
set backspace=indent,eol,start
filetype on
filetype plugin indent on

nnoremap <Space>h :nohlsearch<CR>

"------------------
" ALE Configuration
"------------------

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

call plug#begin()

Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'w0ng/vim-hybrid'

call plug#end()

" Colorscheme
set background=dark
colorscheme hybrid

" Python settings (for now)
let b:ale_fixers = {'python': ['black', 'isort']}
