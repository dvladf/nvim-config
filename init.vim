" disable netrw file explorer
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

set number

set clipboard+=unnamedplus

set termguicolors
set background=dark
" colorscheme everforest
colorscheme gruvbox-material

lua require('plugins')
lua require('init')
lua require('lsp')
lua require('treesitter')
lua require('telescope_')
" lua require('fterm')

" insert new line in normal mode
map <Enter> o<ESC>
map <A-Enter> O<ESC>

" nnoremap <leader>xx <cmd>TroubleToggle<cr>
noremap <silent> <F2> <Cmd>set number <bar> setlocal relativenumber!<CR>

