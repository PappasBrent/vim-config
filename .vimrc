set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

set rnu

set shiftwidth=4

set tabstop=4

set expandtab

set nobackup

set scrolloff=10

set nowrap

set incsearch

set ignorecase

set smartcase

" Show commands as you enter them in the bottom of the screen.
set showcmd

" Show the mode you are on on the last line.
set showmode

set showmatch

set hlsearch

" Save the last 100 previous commands. Default is 20.
set history=100

" Enable pressing tab to open the autocomplete menu.
set wildmenu

" Make wildmenu behave like Bash completion.
set wildmode=list:longest

" Enable terminal GUI colors for catppuccin theme.
set termguicolors

" ALE: Fix on save."
let g:ale_fix_on_save = 1

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'catppuccin/vim', { 'as': 'catppuccin', }

call plug#end()

" Color schemes should be loaded after plug#end().
" Prepend it with silent! to ignore errors when a color scheme is not yet
" installed.
silent! colorscheme catppuccin_frappe

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

let mapleader=" "

inoremap jj <esc>

" Center the cursor vertically after moving to the next match during a search.
nnoremap n nzz
nnoremap N Nzz

" Center vertically after paging up and down.
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Move lines up and down in normal, insert, and visual mode.
" I would use alt for this, but the Gnome terminal intercepts the alt key.
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NERDTree specific mappings.
nnoremap <leader>t :NERDTreeToggle<cr>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable code folding using the marker method.
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" }}}

