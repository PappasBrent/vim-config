" SETTINGS ---------------------------------------------------------------- {{{

" Use Vim defaults instead of Vi defaults.
set nocompatible

" Enable file type detection.
filetype on

" Enable file type specific plugins and indentation.
filetype plugin on
filetype indent on

" Enable syntax highlighting.
syntax on

" Show column number.
set ruler

" Make backspace work like other editors.
set backspace=indent,eol,start

" Turn on relative line numbering.
set rnu

" Use four spaces for tabs.
set shiftwidth=4
set tabstop=4
set expandtab

" Turn off backup files.
set nobackup

" Keep at least 10 lines above and below the cursor.
set scrolloff=10

" Do not soft-wrap text.
set nowrap

" Show matches as a search term is being typed.
set incsearch

" Turn off case-sensitive searching.
set ignorecase

" Turn on case-sensitive searching if we are searching for capital letters.
set smartcase

" Show commands as you enter them in the bottom of the screen.
set showcmd

" Show the mode you are on on the last line.
set showmode

" When a bracket is inserted, briefly jump to the matching one to show where
" it is.
set showmatch

" Highlight previous search term matches.
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

" After writing to a buffer, only wait 100ms before writing to swap file
" (default is 4000ms). This also affects git gutter's update time as well.
set updatetime=100

" Only insert one space after rewrapping text with gq and similar commands.
set nojoinspaces

" Set the leader key to space. Do this here and not in the mappings section to
" make sure the leader key is set correctly for Plugin configurations.
let mapleader=" "

" }}}

" TERMINAL SETINGS ------------------------------------------------------- {{{

" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'catppuccin/vim', { 'as': 'catppuccin', }

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'prabirshrestha/vim-lsp'

Plug 'prabirshrestha/asyncomplete.vim'

Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'mattn/vim-lsp-settings'

Plug 'rhysd/vim-lsp-ale'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-commentary'

" Easily surround text with quotes, brackets, etc.
Plug 'tpope/vim-surround'

" Display the current match number while iterating matches.
Plug 'obcat/vim-hitspop'

" Zen mode for Vim.
Plug 'junegunn/goyo.vim'

" Text-alignment plugin necessary for vim-markdown.
Plug 'godlygeek/tabular'

Plug 'preservim/vim-markdown'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Dictionary
Plug 'farconics/victionary'

" Live server for refreshing web apps as you work on them
Plug 'https://github.com/wolandark/vim-live-server.git', { 'do': 'sudo npm install -g live-server' }

" CoC for code completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vimwiki for note-taking
Plug 'vimwiki/vimwiki'

call plug#end()

" Set plugin-specific settings after plug#end().
" Prepend commands with gilent! to ignore errors.

silent! colorscheme catppuccin_frappe

" ALE: Only use the linters I specifically tell ALE to use.
silent! let g:ale_linters_explicit = 1

" Trim trailing whitespace in all files.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" vim-hitspop: Display match number in bottom right corner of the screen.
let g:hitspop_line   = 'winbot'
let g:hitspop_column = 'winright'
let g:hitspop_timeout = 100

" Goyo: Increase default width.
let g:goyo_width = 85

" LSP: Set up language servers.
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c', 'cpp', 'h', 'hh'],
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

    " Default is ???.
    let g:lsp_format_sync_timeout = 1000
    " Default is 200.
    let g:lsp_completion_resolve_timeout = 100
    " Default is 500.
    let g:lsp_diagnostics_virtual_text_delay = 100
    " Add more file extensions here for format on save.
    autocmd! BufWritePre *.c,*.h,*.tex call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Disable Markdown folding
let g:vim_markdown_folding_disabled = 1

" Don't automatically insert bullets in Markdown files because this has
" issues.
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

inoremap jj <esc>

" Center the cursor vertically after moving to the next match during a search.
nnoremap n nzz
nnoremap N Nzz

" Center vertically after paging up and down.
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Prevent Gnome terminal from eating alt keys so we can use them in mappings.
execute "set <A-j>=\ej"
execute "set <A-k>=\ek"
execute "set <A-q>=\eq"

" Move lines up and down in normal, insert, and visual mode.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Quickly rewrap paragraph.
nnoremap <A-q> gwap

" Copy to clipboard.
vnoremap <C-y> "+y
nnoremap <C-y> "+Y

" NERDTree: Toggle window.
nnoremap <leader>t :NERDTreeToggle<CR>

" ALE: Go to definition.
nnoremap <leader>gd :ALEGoToDefinition<CR>

" FZF: Search files (excluding files that Git ignores).
nnoremap <leader>ff :GFiles<CR>

" FZF: Ripgrep search.
nnoremap <leader>fg :Rg<CR>

" asyncomplete: Default mappings from GitHub.
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Fugitive: Extra mappings.
nnoremap <leader>gp :Git push<CR>

" Goyo: Toggle.
nnoremap zen :Goyo<CR>

" Vimwiki: Export wiki to HTML and browse files.
nnoremap <leader>wb :VimwikiAll2HTML<CR>:Vimwiki2HTMLBrowse<CR>

" MardownPreview: Mappings for normal mode
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable code folding using the marker method.
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" Toggle auto formatting paragraph to wrap text at column limit.
" Taken from https://stackoverflow.com/a/71135553/6824430
function! ToggleFormat()
    if &formatoptions !~ 'a'
        set fo+=a
    else
        set fo-=a
    endif
    " Print the value of formatoptions afterward.
    set formatoptions
endfunction

" Add a mapping to toggle wrapping text in paragraphs.
nnoremap <leader>a :call ToggleFormat()<CR>

" Before running a quickfix command, enable autowrite. This is to make it
" easier to rename across files without vim stopping to ask us to save
" changes.
autocmd QuickFixCmdPre * set autowrite

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" }}}

