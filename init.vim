set number

set termguicolors
set background=dark
colorscheme everforest

lua require('plugins')
lua require('lsp')
lua require('treesitter')
" lua require('fterm')

" insert new line in normal mode
map <Enter> o<ESC>
map <A-Enter> O<ESC>
