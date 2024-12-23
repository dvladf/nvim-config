-- LSP config --

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Enable language servers
lspconfig.rust_analyzer.setup {
  capabilities = cmp_nvim_lsp.default_capabilities(),
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
      hints = {
	type_hints = true,
	parameter_hints = true,
	chaining_hints = true
      },
    }
  },
}
lspconfig.pyright.setup{}
lspconfig.clangd.setup{}
lspconfig.lemminx.setup{}
lspconfig.ocamllsp.setup{}
lspconfig.lua_ls.setup{}
lspconfig.zls.setup{}
lspconfig.gopls.setup{}
lspconfig.racket_langserver.setup{}

-- keymap lsp
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

local navic = require("nvim-navic")

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),

  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    --- toggle inlay hints
    local function toggle_inlay_hints()
      if vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }) then
        vim.lsp.inlay_hint.enable(false, { bufnr = 0 })
      else
        vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
      end
    end

    vim.keymap.set('n', '<leader>dh', toggle_inlay_hints, opts)

    -- enable navic
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      return
    end
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, opts.buffer)
    end

    -- enable formatting
    local function format_block()
      vim.lsp.buf.format({
        async = true,
        range = {
          ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
          ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        }
      })
    end

    vim.keymap.set('v', '<leader>qf', format_block, opts)
    vim.keymap.set('n', '<leader>qf', function()
      vim.lsp.buf.format({async = true})
    end, opts)
  end,
})

-- treesitter plugin

require('nvim-treesitter.configs').setup {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }
}

-- folding

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    vim.opt.foldenable     = false
    vim.opt.foldlevel      = 99
  end
})

-- telescope plugin

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', telescope_builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fs', telescope_builtin.lsp_document_symbols, {})

local telescope = require("telescope")
local telescope_actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
	    i = {
	        ["<C-j>"] = telescope_actions.cycle_history_next,
		["<C-k>"] = telescope_actions.cycle_history_prev,
	    }
	}
    }
})

-- lualine

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename',  'navic'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- autopairs
require("nvim-autopairs").setup {}

