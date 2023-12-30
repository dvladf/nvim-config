local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
	    i = {
	        ["<C-j>"] = actions.cycle_history_next,
		["<C-k>"] = actions.cycle_history_prev,
	    }
	}
    }
})
