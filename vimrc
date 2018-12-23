" Define which shell to use, it started giving errors after removing boxen.
set shell=/bin/bash

" Initialize pathogen to manage plugins
execute pathogen#infect()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

" Turn on line numbers.
set number

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
" Keep some lines visible above/below the cursor while scrolling.
set scrolloff=2
" Read files back from disk automatically when they've changed
set autoread

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

" Use ack instead of grep
set grepprg=ack

" Set global substitution by default
" set gdefault

" Wrap lines longer than the editor width
set wrap
" Only wrap in word boundaries (uses breakat regexp)
" this does not work with the list option enabled
"set linebreak
" Shows the elipsis unicode char in wrapped lines
" (requires encoding set to utf-8 to use the utf-8 chars.)
set encoding=utf-8
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
set wildignore=*/.git/*,*/.bundle/*,*/vendor/bundle/*,*/vendor/cache/*,*/log/*,*/tmp/*,*/app/assets/images/*,*/solr/*,*/uploads/*,*/pkg/*,.tags,*/coverage/*,*/dist/*,*/out/*,*/node_modules/*

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

" Set the default ctags file
set tags+=.tags

" Use Ctrl+[ to climb back the tree after navigating tags with Ctrl+]
" map <C-[> <C-t>

" Use window movement with Ctrl-h instead of Ctrl-w h and so on
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable cursor keys in normal mode
map <Left>  :echo ":trollface:"<cr>
map <Right> :echo ":trollface:"<cr>
map <Up>    :echo ":trollface:"<cr>
map <Down>  :echo ":trollface:"<cr>

" Jump to next/previous screen row in the editor instead of the line when wrapping.
nmap j gj
nmap k gk

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

" Expand to directory of current file - http://vimcasts.org/e/14
cnoremap $$ <C-R>=expand('%:h').'/'<cr>
" Expand to full path (directory + file)
" ":echo expand('%:p')    /abc/def/my.txt  full path
cnoremap $% <C-R>=expand('%:p')<cr>
" Expand to name of file
" :echo expand('%:t')     my.txt            name of file ('tail')
cnoremap %% <C-R>=expand('%:t')<cr>
" Expands to directory name (from the opened folder, not the full path)
" :echo expand('%:p:h')   /abc/def          directory containing file ('head')
cnoremap %$ <C-R>=expand('%:p:h').'/'<cr>

" Clear the search highlight when hitting return
nnoremap <cr> :nohlsearch<cr><cr>

" Start a global search/replace for the word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" Easier editing for split, vertical split and tab based on the current dir
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" No more Ack typing.
cmap ack Ack
map <leader>a :Ack 

" Copy selection to clipboard
vmap <leader>cp :w !pbcopy<CR><CR>

" Reload the config
nmap <leader>rc :so $MYVIMRC<CR>

" Commentary original mappings - keep them out for now to see if I can get
" used to the new `gc`.
" xmap \\  <Plug>Commentary
" nmap \\  <Plug>Commentary
" nmap \\\ <Plug>CommentaryLine
" nmap \\u <Plug>CommentaryUndo

" Snipmate setup
source ~/.vim/snippets/support_functions.vim

" Load a local vimrc file if it's available.
if filereadable(expand("~/.localvimrc"))
  source ~/.localvimrc
endif

" CtrlP - ignore dotfiles and dotdirs
let g:ctrlp_dotfiles = 0
" CtrlP - height of match window
let g:ctrlp_max_height = 12
" CtrlP - change working path mode to use the parent directory only.
" 0: don't manage; 1: use the parent dir; 2: use the nearest .git/.svn/etc dir
let g:ctrlp_working_path_mode = 0

" Vim-go - disable the autoinstall the necessary go binaries behavior
let g:go_disable_autoinstall = 1
" Vim-go - Disable auto fmt on save
let g:go_fmt_autosave = 0

" RTFPygmentize to copy with format
let g:rtfp_theme = 'default'
let g:rtfp_font = 'Monaco'

" configure emmet indentation and shortcut
let g:user_emmet_leader_key = '<c-x>'
let g:user_emmet_settings = { 'indentation' : '  ' }

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

  " Treat typescript files as javascript
  " autocmd BufNewFile,BufRead *.ts setfiletype javascript

  " Strip trailing whitespace for the following file extensions
  autocmd BufWritePre *.rb,*.rake,*.erb,*.yml,*.css,*.scss,*.sass,*.styl,*.js,*.json,*.coffee,*.ts,*.html,*.md,*.rdoc,*.textile,*.ex,*.exs,Gemfile :call StripTrailingWhitespaces()

  " Change indent rules for javascript/typescript
  autocmd FileType javascript,typescript set shiftwidth=4 tabstop=4 softtabstop=4
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
  exec ':vsp ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '^app/') != -1 || match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<mailers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
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
map <leader>r :call RunNearestTest()<cr>
map <leader>T :call RunTests('')<cr>

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
