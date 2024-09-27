" Format with clang-format and fix with clangtidy.
let b:ale_fixers = ['clang-format', 'clangtidy']
" Lint with clangd and clangtidy.
let b:ale_linters = ['clangd', 'clangtidy']
" Common linting options.
let b:ale_c_clangtidy_options = '-Wall -Wextra -Weverything -pedantic'
" Append include path to file definition search path.
let &path='.,/usr/include/,,include/'
