" Netrw file explorer settings
let g:netrw_banner = 1
let g:netrw_liststyle = 3

set number

set clipboard+=unnamedplus

set termguicolors
set background=dark
colorscheme kanagawa
" colorscheme everforest
" colorscheme gruvbox-material

lua require('plugins')
lua require('init')

" insert new line in normal mode
map <Enter> o<ESC>
map <A-Enter> O<ESC>

" nnoremap <leader>xx <cmd>TroubleToggle<cr>
noremap <silent> <F2> <Cmd>set number <bar> setlocal relativenumber!<CR>

