" Initialize pathogen to manage plugins
call pathogen#infect()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

" Turn on line numbers. Use either number or relativenumber.
"set number

" Show line number relative to the cursor position
set relativenumber

" Show line and column number of the cursor position
set ruler

" Show current mode in the bottom (insert/replace/visual)
set showmode

" Indent width
set shiftwidth=2
" Tab width while viewing
set tabstop=2
" Tab width while editing (insert/remove 'tabs')
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

" Enable automatic filetype detection, plugin options and indent files.
filetype plugin indent on

" Set default colorscheme
colorscheme railscasts

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
set smartcase

" Set global substitution by default
set gdefault

" Wrap lines longer than the editor width
set wrap
" Only wrap in word boundaries (uses breakat regexp)
" this does not work with the list option enabled
"set linebreak
" Shows the elipsis unicode char in wrapped lines
set showbreak=…

" Display tabs and trailing spaces
set list
set listchars=tab:\ ¬,trail:.

" Enable mouse
set mouse=a

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Allow backgrounding buffers without unloading/writing them
set hidden

" Show code completion menu when typing commands
set wildmenu
" Set code completion to be similar to the command line
set wildmode=list:longest
" Ignore files from listings
set wildignore=.git,tmp/*

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

" Better tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" Textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Snipmate setup
source ~/.vim/snippets/support_functions.vim

" Command+T setup
let g:CommandTMaxHeight=20

" Enable syntax error signs
let g:syntastic_enable_signs=1

" Preserve history and cursor position while executing the given command
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! StripTrailingWhitespaces()
  call Preserve("%s/\\s\\+$//e")
endfunction
nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>

function! StripBlankLines()
  call Preserve("g/^$/d")
endfunction
nnoremap <silent> <F6> :call StripBlankLines()<CR>

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " [Example] Customisations based on house-style (arbitrary)
  "autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  "autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  "autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " [Example] Treat .rss files as XML (example)
  "autocmd BufNewFile,BufRead *.rss setfiletype xml

  autocmd BufWritePre *.rb,*.erb,*.yml,*.css,*.js,*.json,*.html :call StripTrailingWhitespaces()
endif

" Format json using python json.tool
function! FormatJson()
  %!python -m json.tool
endfunction
