" Netrw file explorer settings
let g:netrw_banner = 1
let g:netrw_liststyle = 3

set number

set clipboard+=unnamedplus

let g:gruvbox_material_background = 'hard'

set termguicolors
set background=dark
"colorscheme everforest
colorscheme gruvbox-material
"colorscheme kanagawa

set noet ci pi sts=0 sw=4 ts=4

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

" enable debugging
packadd termdebug
let g:termdebug_wide=1
