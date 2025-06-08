set nocompatible
syntax enable
set ignorecase
set ruler
set number
set wildmenu
set smartindent
set shiftwidth=4
set tabstop=4
set mouse+=a
set backspace=indent,eol,start
set encoding=utf-8
filetype on
filetype plugin indent on

nnoremap <Space>h :nohlsearch<CR>
nnoremap <Space>n :NERDTreeToggle<CR>

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
let g:ale_echo_msg_format = '[%linter%] %s'

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'w0ng/vim-hybrid'
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" Colorscheme
set background=dark
colorscheme hybrid

" ALE Setting
let g:ale_linters = {
			\ 'cpp': ['clangd']
			\ }

let g:ale_fixers = {
			\ 'cpp': ['clangtidy'],
			\ 'python': ['black', 'isort'],
			\ }

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#buffer_nr_show = 1
