set number

set clipboard+=unnamedplus

set termguicolors
set background=dark
" colorscheme everforest
colorscheme gruvbox-material

lua require('plugins')
lua require('lsp')
lua require('treesitter')
lua require('telescope_')
" lua require('fterm')

" insert new line in normal mode
map <Enter> o<ESC>
map <A-Enter> O<ESC>

" nnoremap <leader>xx <cmd>TroubleToggle<cr>
noremap <silent> <F2> <Cmd>set number <bar> setlocal relativenumber!<CR>

" Netrw file explorer settings
let g:netrw_banner = 1
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 3
