" User settings
syntax enable
set fenc=utf-8
set smartcase
set hlsearch
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
let g:ale_fix_on_save = 1
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'vue': ['eslint'],
    \ }
let g:ale_fixers = {
    \ 'python': ['black', 'isort', 'autoimport'],
    \ }
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" fugitive (git tool)
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
nnoremap <Space>gg :Gstatus<Enter>
nnoremap <Space>gb :GBrowse<Enter>
nnoremap <Space>gr :Gread<Enter>
nnoremap <Space>gd :Gdiff<Enter>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P

" markdown preview
Plugin 'iamcco/markdown-preview.nvim'

" PEP8 Indent for Python
Plugin 'Vimjas/vim-python-pep8-indent'

" Tabnine
Plugin 'codota/tabnine-vim'

" vim-lsp
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'mattn/vim-lsp-settings'
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" nnoremap <C-j> :LspNextDiagnostic<Enter>
" nnoremap <C-k> :LspPreviousDiagnostic<Enter>
" nnoremap <Space>d :vs<Enter><C-w>w:LspDefinition<Enter>
" nnoremap <Space>D :vs<Enter><C-w>w:LspDeclaration<Enter>
" nnoremap <Space>r :LspRename<Enter>
" let g:lsp_diagnostics_echo_cursor = 1
" set omnifunc=lsp#complete

" augroup LspAutoFormatting
"     autocmd!
"     autocmd BufWritePre * LspDocumentFormatSync
" augroup END

" editorconfig
Plugin 'editorconfig/editorconfig-vim'

" vim-easy-align
Plugin 'junegunn/vim-easy-align'

" commentary
Plugin 'tpope/vim-commentary'

" Vue.js plugin
Plugin 'leafOfTree/vim-vue-plugin'
let g:vim_vue_plugin_config = {
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css', 'scss', 'sass'],
      \   'i18n': ['json', 'yaml'],
      \   'route': 'json',
      \},
      \'full_syntax': ['json'],
      \'initial_indent': ['i18n', 'i18n.json', 'yaml'],
      \'attribute': 1,
      \'keyword': 1,
      \'foldexpr': 0,
      \'debug': 0,
      \}

" vim-fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
nnoremap <Space>ff :Files<Enter>
nnoremap <Space>fg :Commits<Enter>
nnoremap <Space>fr :Rg<Enter>

call vundle#end()
filetype plugin indent on
" --Vundle settings end--

" Set the theme
set background=dark
colorscheme hybrid
