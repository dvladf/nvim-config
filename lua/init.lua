-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', {
    noremap = true
})
