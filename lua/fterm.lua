require'FTerm'.setup({
    border = 'double',
    cmd = '/usr/bin/fish',
    dimensions  = {
        height = 0.95,
        width = 0.95,
    },
})

-- Example keybindings
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
