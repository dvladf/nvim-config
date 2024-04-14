local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'   -- plugins manager
  use 'neovim/nvim-lspconfig'    -- configs collection for nvim lsp client
  use 'folke/neodev.nvim'        -- Neovim setup for init.lua and plugin development

  -- autocompletion
  use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'         -- Snippets plugin

  use 'sainnhe/everforest'       -- color scheme
  use 'sainnhe/gruvbox-material' -- another color scheme

  use {'kevinhwang91/nvim-bqf'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'wsdjeg/vim-fetch'}

  use {'nvim-tree/nvim-web-devicons'}
  use {'folke/trouble.nvim'}

  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim', tag = '0.1.3'}

  use {'tpope/vim-fugitive'}             -- Git plugin
  use {'ntpeters/vim-better-whitespace'} -- Show trailing whitespace

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {'SmiteshP/nvim-navic'} -- show current code context in a statusline or winbar

  use {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim'} -- rainbow parentheses

  -- debugging
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
