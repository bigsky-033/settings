"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

set encoding=utf8

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Sets how many lines of history VIM has to remember
set history=1000

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable mouse support.
set mouse+=a

" A buffer becomes hidden when it is abandoned
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Make backspace behave more reasonably
set backspace=indent,eol,start

" Enable syntax highlighting
syntax enable

"Always show current position
set ruler

" Show line numbers.
set number

" Turn on the Wild menu
set wildmenu

" Give more space for displaying messages.
set cmdheight=2

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

" Auto indent
set autoindent

" Smart indent
set smartindent "Smart indent

" Enable line wrapping.
set wrap

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin()

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'nanotech/jellybeans.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" preservim/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stick this in your vimrc to open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" preservim/tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you do this the F8 key will toggle the Tagbar window.
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nathanaelkane/vim-indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nanotech/jellybeans.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set colorscheme as jellybeans
colorscheme jellybeans

