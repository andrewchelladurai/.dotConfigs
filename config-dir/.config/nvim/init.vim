"
" Customizations for Neovim : https://neovim.io/
"
" The config must be placed at
" ~/.config/nvim/init.vim on the local system.
"
" For this file's details see
" https://neovim.io/doc/user/starting.html#init.vim
"
" Tips : https://neovim.io/doc/user/tips.html
" Tabs : https://neovim.io/doc/user/tabpage.html
"

""""""""""""""""""
" Configurations
" For configuration that can be used in the file see
" https://neovim.io/doc/user/quickref.html
" https://neovim.io/doc/user/quickref.html#option-list
""""""""""""""""""


set autochdir
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,nostop
set writebackup
set backupdir=~/.cache/nvim/backup/
set linebreak
set breakat=^I!@*-+;:,./?
set breakindent
set browsedir=buffer
set bufhidden=delete
set buflisted
set clipboard=unnamedplus
set cmdheight=2
set cmdwinheight=13
"set colorcolumn=86
set completeopt=menuone,preview
set concealcursor=nc
set confirm
set copyindent
set nocursorbind
"set cursorcolumn
set cursorline
set cursorlineopt=line
set delcombine
set endofline
set equalalways
set errorbells
set expandtab
set fileformats=unix
set fileignorecase
set fixendofline
"set fillchars=stl:.,stlnc:=,vert:│,fold:·,diff:-
set foldclose=all
set foldcolumn=auto
set foldenable
set foldlevel=0
set foldmarker={{{,}}}
set foldmethod=indent
set foldopen=all
set helpheight=29
set hlsearch
set history=969
set ignorecase
set incsearch
set infercase
set nojoinspaces
set laststatus=2
set lazyredraw
set linebreak
set list
"set listchars=eol:¬,lead:\ ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,
set magic
set matchpairs=(:),{:},[:],<:>,':',":"
set maxmapdepth=969
set maxfuncdepth=969
set modeline
set modelines=3
set modified
set modifiable
set more
set mouse=nvi
"set selectmode=mouse
set mousefocus
set mousemodel=popup_setpos
set mousehide
"set mouseshape=i:beam,r:beam,s:updown,sd:cross,m:no,ml:up-arrow,v:rightup-arrow
set number
set relativenumber
set nopreserveindent
set previewheight=13
set ruler
set scrolloff=3
set noshelltemp
set shiftround
set shiftwidth=4
set showbreak=+++ 
set showcmd
set showmatch
set showmode
set showtabline=1
set sidescrolloff=3
set signcolumn=auto
set smartcase
set smartindent
set smarttab
set nospell
set spellsuggest=best
set splitbelow
set splitright
set directory=~/.cache/nvim/swap/
set syntax=on
set tagcase=followscs
set undodir=~/.cache/nvim/undo/
set undofile
set undolevels=969
set undoreload=969
set warn
set wildignorecase
set wildmenu
set wildmode=full
set wildoptions=pum,tagfile
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wrap
set textwidth=96
set writebackup

""""""""""""""""""
" Mappings
" https://neovim.io/doc/user/map.html
""""""""""""""""""

" Map leader to comma
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Disable highlight when <leader><cr> is pressed
nnoremap <leader><cr> set hlsearch! hlsearch?<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Remap VIM 0 to first non-blank character
map 0 ^

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

