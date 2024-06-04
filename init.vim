" Netrw file explorer settings
let g:netrw_banner = 1
let g:netrw_liststyle = 3

set number

set clipboard+=unnamedplus

set termguicolors
set background=dark
"colorscheme everforest
"colorscheme gruvbox-material
colorscheme kanagawa

lua require('plugins')
lua require('init')

set laststatus=3

" insert new line in normal mode
map <Enter> o<ESC>
map <A-Enter> O<ESC>

" nnoremap <leader>xx <cmd>TroubleToggle<cr>
noremap <silent> <F2> <Cmd>set number <bar> setlocal relativenumber!<CR>
tnoremap <Esc> <C-\><C-n>


" rainbow-delimiters colors
highlight link RainbowDelimiterRed Keyword
highlight link RainbowDelimiterBlue Identifier
highlight link RainbowDelimiterOrange Operator

