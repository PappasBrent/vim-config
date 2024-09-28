set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

" Make backspace work like other editors.
set backspace=indent,eol,start

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

" Tell the terminal not to wait for sequences starting with the escape key.
set ttimeoutlen=0

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'catppuccin/vim', { 'as': 'catppuccin', }

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'prabirshrestha/vim-lsp'

Plug 'rhysd/vim-lsp-ale'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

call plug#end()

" Set plugin-specific settings after plug#end().
" Prepend commands with gilent! to ignore errors.

silent! colorscheme catppuccin_frappe

" ALE: Fix on save."
silent! let g:ale_fix_on_save = 1

silent! let g:ale_linters_explicit = 1

" YouCompleteMe: Clangd binary path.
silent! let g:ycm_clangd_binary_path='/usr/bin/clangd'

" LSP: Set up language servers.
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

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

" NERDTree: Toggle window.
nnoremap <leader>t :NERDTreeToggle<CR>

" ALE: Go to definition.
nnoremap <leader>gd :ALEGoToDefinition<CR>

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

