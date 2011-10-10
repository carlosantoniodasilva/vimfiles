"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

" Turn on line numbers
set number

" Show line number relative to the cursor position
set relativenumber

" Show line and column number of the cursor position
set ruler

" Show current mode in the bottom (insert/replace/visual)
set showmode

" Indent width
set shiftwidth=2
" Tab width
set softtabstop=2
" Auto indent
set autoindent
" Tabs to spaces
set expandtab
" Try to be smart about indenting whenever possible
set smartindent
" Insert/delete blanks according to shiftwidth in the front of lines
set smarttab

" Turn on syntax highlighting
syntax on

" Highlight column
set colorcolumn=80

" Highlight line
"set cursorline
" Highlight column
"set cursorcolumn

" Add extra pixels between lines
set linespace=1

" No folding! I hate folding!
set nofoldenable

" Incremental search
set incsearch
" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase
" Only use ignore case for search patterns with downcase chars
"set smartcase

" Set global substitution by default
set gdefault

" Wrap lines longer than the editor width
set wrap
" Only wrap in word boundaries (uses breakat regexp)
" this does not work with the list option enabled
"set linebreak

" Display tabs and trailing spaces
set list
set listchars=tab:\ ¬,trail:.

" Enable mouse
set mouse=a

" Allow backspacing over everything in insert mode
"set backspace=indent,eol,start

" Show code completion menu when typing commands
set wildmenu
set wildmode=list:longest

" Don't make backup files
set nobackup
" Don't use swap files 
set noswapfile
" Where to put swap files
set directory=/tmp
" Where to put backup files
set backupdir=/tmp

" Disable visual bells / beeps
set visualbell t_vb=


" Use window movement with Ctrl-h instead of Ctrl-w h and so on
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use Cmd + N to change tabs
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
