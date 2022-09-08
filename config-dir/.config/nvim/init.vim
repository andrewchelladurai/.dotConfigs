"
" Customizations for Neovim : https://neovim.io/
" 
" The config must be placed at
" ~/.config/nvim/init.vim o nthe local system.
" 
" For this files details see
" https://neovim.io/doc/user/starting.html#init.vim
" 
" For configuration that can be used in the file see
" https://neovim.io/doc/user/quickref.html
"

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Assume a dark background
set background=dark

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
  syntax enable
endif

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm


" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Numbers on the left
set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftround

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

"Insert “tabstop” number of spaces when the “tab” key is pressed.
set smarttab

" Blink cursor on error instead of beeping (grr)
set visualbell

" Disable beep on errors.
set noerrorbells

" Encoding
set encoding=utf-8

" Whitespace
set wrap

" auto fold code
set foldenable

" the /g flag on :s substitutions by default
set gdefault

"Avoid wrapping a line in the middle of a word.
set linebreak

" Wrap-broken line prefix
set showbreak=+++

" Highlight problematic whitespace
set list
"set listchars=nbsp:%,tab:▸\ ,trail:_,eol:¬,precedes:←,extends:→

" scroll offset
set scrolloff=1
set sidescrolloff=3
set scrolljump=5

" use % to jump between pairs
set matchpairs+=<:>

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" show matching pairs brackets/parenthesis
set showmatch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Visualize tabs and newlines

"Don’t update screen during macro and script execution.
set lazyredraw

"Display command line’s tab complete options as a menu.
set wildmenu
set wildmode=full

"Highlight the line currently under cursor.
set cursorline

" highlight the column the cursor is on
"set  cursorcolumn

" highlight column 80 with the color
set colorcolumn=80

" Directory to store backup files.
set backupdir=~/.cache/vim/

" Directory to store swap files.
set dir=~/.cache/vim/

" Delete comment characters when joining lines.
set formatoptions+=j

" doN'T insert two spaces after a period when joining lines
set  nojoinspaces

" Increase the undo limit.
set history=969

" Enable spellchecking.
set spell
set spelllang=en_us

" No extra spaces between rows
set linespace=0

" Yank from the cursor to the end of the line, similar to C and D.
nnoremap Y y$

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

" search relative to the directory of the current file
set path+=.
" search in the working directory
set path+=,,

" always show the number of lines changed
set report=0

" Show tab bar
set showtabline=2	
