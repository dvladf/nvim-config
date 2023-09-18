set number

set clipboard+=unnamedplus

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

nnoremap <leader>xx <cmd>TroubleToggle<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
