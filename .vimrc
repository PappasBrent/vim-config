""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " Use Vim defaults instead of Vi defaults

filetype on                 " Enable filetype detection
filetype plugin on          " Enable filtype-specific plugins
filetype indent on          " Enable filetype-specific indentation

syntax on                   " Enable syntax highlighting

" Basic settings
set number                  " Enable line numbers
set ruler                   " Show column number
set relativenumber          " Turn on relative line numbering
set cursorline              " Highlight current line
set nowrap                  " Do not soft-wrap text
set scrolloff=10            " Keep at least 10 lines above and below the cursor
set sidescrolloff=10        " Keep at least 8 columns left/right of the cursor

" Indentation
let tabsize=4
let &tabstop=tabsize        " Tab width
let &shiftwidth=tabsize     " Shift width
let &softtabstop=tabsize    " Soft tab stop
set expandtab               " Replace tabs with spaces
set smartindent             " Use smart auto-indenting
set autoindent              " Use indent from current line

" Search settings
set ignorecase              " Turn off case-sensitive searching
set smartcase               " Case-sensitive searching for capital letters only
set hlsearch                " Highlight previous search term matches
set incsearch               " Show matches as a search term is being typed

" Visual settings
set termguicolors                           " Enable 24-bit colors
set signcolumn=yes                          " Always show sign column
set colorcolumn=80                          " Show column at 80 characters
set showmatch                               " Highlight matching brackets
set matchtime=2                             " How long to show matching bracket
set cmdheight=1                             " Command line height
set completeopt=menuone,noinsert,noselect   " Completion options
set showcmd                                 " Show commands at bottom of screen as they are typed
set noshowmode                              " Don't show mode in command line
" set pumheight=10                          " Popup menu height
" set pumblend = 10                         " Popup menu transparency
" set winblend = 0                          " Floating window transparency
set conceallevel=0                          " Don't hide markup
let &concealcursor=""                       " Don't hide cursor line markup
set lazyredraw                              " Don't redraw during macros
set synmaxcol=300                           " Syntax highlighting limit

" File handling
set nobackup                                " Don't create backup files
set nowritebackup                           " Don't create backup before writing
set noswapfile                              " Don't create swap files
set undofile                                " Persistent undo
let &undodir=expand("$HOME/.vim/undodir")   " Undo directory
set updatetime=300                          " Faster completion
set timeoutlen=0                            " Key timeout duration; don't wait for sequences starting with the escape key
set ttimeoutlen=0                           " Key code timeout
set autoread                                " Auto reload files changed outside vim
set noautowrite                             " Don't auto save

" Behavior settings
set hidden                                  " Allow hidden buffers
set noerrorbells                            " No error bells
set backspace=indent,eol,start              " Better backspace behavior
set noautochdir                             " Don't auto change directory
set iskeyword+=-                            " Treat dash as part of word
set path+=**                                " Include subdirectories in search
set selection=exclusive                     " Selection behavior
set mouse=a                                 " Enable mouse support
set clipboard^=unnamed,unnamedplus          " Use system clipboard
set modifiable                              " Allow buffer modifications
set encoding=utf8                           " Set encoding
set nojoinspaces                            " Only insert one space after rewrapping text with gq and similar commands

set wildmenu                " Enable pressing tab to open the autocomplete menu.
set wildmode=list:longest   " Make wildmenu behave like Bash completion.

" Split behavior
set splitbelow                              " Horizontal splits go below
set splitright                              " Vertical splits go right

" Key mappings
let mapleader=" "                   " Set leader key to space
let maplocalleader=" "              " Set local leader key to space

" Create undo directory if it doesn't exist
let undodir=expand("$HOME/.vim/undodir")
if isdirectory(undodir) == 0
  call mkdir(undodir, "p")
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'mg979/vim-visual-multi', {'branch': 'master'}     " Multi-select.
Plug 'catppuccin/vim', { 'as': 'catppuccin', }          " Catppuccin themes.
Plug 'tpope/vim-fugitive'                               " Git support.
Plug 'airblade/vim-gitgutter'                           " See git changes.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy find.
Plug 'junegunn/fzf.vim'                                 " Fuzzy find for Vim.
Plug 'christoomey/vim-tmux-navigator'                   " Tmux + Vim.
Plug 'tpope/vim-commentary'                             " Toggle comments.
Plug 'tpope/vim-surround'                               " Add delimeters.
Plug 'obcat/vim-hitspop'                                " Dispay search index.
Plug 'junegunn/goyo.vim'                                " Zen mode for Vim.
Plug 'godlygeek/tabular'                                " Text-alignment; dependency of vim-markdown.
Plug 'preservim/vim-markdown'                           " Markdown features.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Preview Markdown files.
Plug 'farconics/victionary'                             " Dictionary
Plug 'https://github.com/wolandark/vim-live-server.git', { 'do': 'sudo npm install -g live-server' } " Live server for refreshing web apps as you work on them
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " CoC for for LSP and code completion.
Plug 'vimwiki/vimwiki'                                  " Vimwiki for note-taking

call plug#end()

" Set plugin-specific settings after plug#end().
" Prepend commands with gilent! to ignore errors.

silent! colorscheme catppuccin_frappe

" vim-hitspop: Display match number in bottom right corner of the screen.
let g:hitspop_line   = 'winbot'
let g:hitspop_column = 'winright'
let g:hitspop_timeout = 100

" Goyo: Increase default width.
let g:goyo_width = 85

" Disable Markdown folding
let g:vim_markdown_folding_disabled = 1

" Don't automatically insert bullets in Markdown files because this has
" issues.
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Vimwiki: Use templates when exporting to HTML
let g:vimwiki_list = [
  \ {
      \ 'path': '~/vimwiki/',
      \ 'path_html': '~/vimwiki/public_html/',
      \ 'template_path': '~/vimwiki/templates',
      \ 'template_default': 'default',
      \ 'template_ext': '.html'
  \ },
  \ {
      \ 'path': '~/documents/teaching/cop-3402-spring-2026-old',
      \ 'path_html': '~/documents/teaching/cop3-402-spring-2026-old/public_html',
      \ 'template_path': '~/documents/teaching/templates',
      \ 'template_default': 'default',
      \ 'template_ext': '.html'
  \ }
\ ]

" Disable vimwiki mode if not in a vault.
let g:vimwiki_global_ext = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" FZF: Search files (excluding files that Git ignores).
nnoremap <leader>ff :GFiles<CR>

" FZF: Ripgrep search.
nnoremap <leader>fg :Rg<CR>

" Fugitive: Extra mappings.
nnoremap <leader>gp :Git push<CR>

" GitGutter: Default mappings.
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)

" Goyo: Toggle.
nnoremap zen :Goyo<CR>

" Vimwiki: Export wiki to HTML and browse files.
nnoremap <leader>wb :VimwikiAll2HTML<CR>:Vimwiki2HTMLBrowse<CR>
nnoremap <leader>wc :VimwikiIndex 2<CR>

" MardownPreview: Mappings for normal mode
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" Victionary: Set mappings.
let g:victionary#map_defaults = 0
nmap <leader>d <Plug>(victionary#define_prompt)
nmap <leader>D <Plug>(victionary#define_under_cursor)
nmap <leader>y <Plug>(victionary#synonym_prompt)
nmap <leader>Y <Plug>(victionary#synonym_under_cursor)

" CoC: Default configuration
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMSCRIPT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType tex,plaintex let g:goyo_linenr=1
  autocmd FileType tex,plaintex Goyo
augroup end

