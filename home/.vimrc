set nu
set relativenumber
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set ignorecase
set smartcase
set cursorline
set relativenumber
set wildmode=longest:full
set wildmenu
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set hidden
set showcmd
set showmode
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

colorscheme evening
filetype plugin on
let g:pydiction_location = '~/.vim/complete-dict'
