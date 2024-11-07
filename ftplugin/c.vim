" Format with clang-format.
let b:ale_fixers = ['clang-format']
" Lint with clangd and clangtidy.
let b:ale_linters = {'c': ['clangd', 'clangtidy']}
" Common linting options.
let b:ale_c_clangtidy_options = '-Wall -Wextra -Weverything -pedantic'
" Append include path to file definition search path.
let &path='.,/usr/include/,,include/'
