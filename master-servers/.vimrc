"
" Copyright (C) 2007-2016 David Jia Wei Li
"
" .vimrc Configuration for Server Users
"



syntax on
colorscheme desert

set nocompatible      "Allows more features
set clipboard=unnamed "Use OS clipboard
set wildmenu          "Better completion
set ttyfast           "Faster terminal connections


"Searching
set incsearch     "Turn on incremental searching
set ignorecase    "Ignore case when searching
set smartcase     "Ignore case when typing lowercase,
                   "otherwise match case
set scrolloff=2   "Keep 2 lines of code before & after the cursor

set autoindent    "Automatic line indentation
set tabstop=4     "Set tab character to 4 characters
set expandtab     "Turn tabs into whitespace
set shiftwidth=4  "Indent width for autoindent

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

"Shortcut to auto indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

"File handling
set nobackup      "Do not litter my working dir with backup files

"Line numbers
set number        "Turn on line numbering

"Line wrapping settings
set wrap          "Turn on line wrapping
set textwidth=0 wrapmargin=0

filetype indent plugin on
autocmd Filetype gitcommit setlocal spell textwidth=72

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
