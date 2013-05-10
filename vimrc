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
" colorscheme railscasts
" colorscheme default
set background=light
colorscheme solarized

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
set listchars=nbsp:¬,tab:\ ¬,trail:.

" Enable mouse
set mouse=a

" Switch paste mode with F2 to quickly disable/enable indenting for paste.
set pastetoggle=<F2>

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Allow backgrounding buffers without unloading/writing them
set hidden

" Show code completion menu when typing commands
set wildmenu
" Set code completion to be similar to the command line
set wildmode=list:longest
" Ignore files from listings
set wildignore=*/.git/*,*/.bundle/*,*/vendor/bundle/*,*/vendor/cache/*,*/log/*,*/tmp/*,*/app/assets/images/*,*/solr/*

" Store more :cmdline history
set history=100

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

" Always show status bar
set laststatus=2

" Change the leader from \ to ,
" let mapleader=","

" Open new split panes to right and bottom, which feels more natural than vim’s default:
set splitbelow
set splitright

" Use window movement with Ctrl-h instead of Ctrl-w h and so on
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" disable cursor keys in normal mode
map <Left>  :echo ":trollface:"<cr>
map <Right> :echo ":trollface:"<cr>
map <Up>    :echo ":trollface:"<cr>
map <Down>  :echo ":trollface:"<cr>

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

" https://github.com/r00k/dotfiles/blob/master/vimrc
" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
" Disable K looking man stuff up
map K <Nop>

" Double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Clear the search highlight when hitting return
nnoremap <cr> :nohlsearch<cr><cr>

" Easier editing for split, vertical split and tab based on the current dir
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Snipmate setup
source ~/.vim/snippets/support_functions.vim

" CtrlP - ignore dotfiles and dotdirs
let g:ctrlp_dotfiles = 0
" CtrlP - height of match window
let g:ctrlp_max_height = 12
" CtrlP - change working path mode to use the parent directory only.
" 0: don't manage; 1: use the parent dir; 2: use the nearest .git/.svn/etc dir
let g:ctrlp_working_path_mode = 0

" RTFPygmentize to copy with format
let g:rtfp_theme = 'default'
let g:rtfp_font = 'Monaco'

" configure zencoding indentation and shortcut
let g:user_zen_leader_key = '<c-x>'
let g:user_zen_settings = { 'indentation' : '  ' }

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

  autocmd BufWritePre *.rb,*.rake,*.erb,*.yml,*.css,*.scss,*.sass,*.js,*.json,*.coffee,*.html,*.md,*.rdoc,*.textile,Gemfile :call StripTrailingWhitespaces()
endif

" Format json using python json.tool
function! FormatJson()
  %!python -m json.tool
endfunction

" Rename current file, thanks to Gary Bernhardt (garybernhardt).
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>


" Switch between test and production code, thanks to Gary Bernhardt (garybernhardt).
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>


" Running tests with few mods, thanks to Gary Bernhardt (garybernhardt).
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:cas_test_file")
    return
  end
  call RunTests(t:cas_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:cas_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename.
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo

  if match(a:filename, '\.feature$') != -1
    exec ":!cucumber " . a:filename
  elseif match(a:filename, '_spec\.rb') != -1
    exec ":!rspec --color " . a:filename
  elseif match(a:filename, '_test\.rb') != -1
    exec "!ruby -Itest " . a:filename
  else " Assume rspec by default to run the entire suite, instead of using rake.
    exec ":!rspec --color"
  endif
endfunction
