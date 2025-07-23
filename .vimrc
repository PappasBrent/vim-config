""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " Use Vim defaults instead of Vi defaults.

filetype on             " Enable filetype detection.
filetype plugin on      " Enable filtype-specific plugins.
filetype indent on      " Enable filetype-specific indentation.

syntax on               " Enable syntax highlighting.

set ruler               " Show column number.
set colorcolumn=80      " Color column 80.
set rnu                 " Turn on relative line numbering.

set backspace=indent,eol,start  " Make backspace work like other editors.

set shiftwidth=4        " Use four spaces for shifting.
set tabstop=4           " Use four spaces for tabs.
set expandtab           " Replace tabs with spaces.

set nobackup            " Turn off backup files.

set scrolloff=10        " Keep at least 10 lines above and below the cursor.
set nowrap              " Do not soft-wrap text.

set incsearch           " Show matches as a search term is being typed.
set ignorecase          " Turn off case-sensitive searching.
set smartcase           " Case-sensitive searching for capital letters only.
set hlsearch            " Highlight previous search term matches.

set showcmd             " Show commands at bottom of screen as they are typed.
set showmode            " Show the mode you are on on the last line.
set showmatch           " Briefly jump to matching bracket upon bracket insert.

set history=100         " Save the last 100 previous commands. Default is 20.

set wildmenu                " Enable pressing tab to open the autocomplete menu.
set wildmode=list:longest   " Make wildmenu behave like Bash completion.

set termguicolors   " Enable terminal GUI colors for catppuccin theme.
set ttimeoutlen=0   " Tell the terminal not to wait for sequences starting with the escape key.

set updatetime=100  " After writing to a buffer, only wait 100ms before writing to swap file (default is 4000ms). This affects git gutter's update time as well.

set nojoinspaces    " Only insert one space after rewrapping text with gq and similar commands.

let mapleader=" "   " Set the leader key to space, before loading plugins.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERMINAL SETINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
let g:vimwiki_list = [{
  \ 'path_html': '~/vimwiki/public_html/',
  \ 'template_path': '~/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html'}]

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

