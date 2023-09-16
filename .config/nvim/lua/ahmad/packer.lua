vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colors
  use { "ellisonleao/gruvbox.nvim" }
  use { "navarasu/onedark.nvim" }

  -- highlight TODO
  use {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
      }
  }

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }

  -- lsp-zero
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	  }
  }

  -- commenting
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- auto closing pairs
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- git
  use { "lewis6991/gitsigns.nvim" }

  -- tabs
  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  use {'romgrk/barbar.nvim'}
  use {'nvim-tree/nvim-web-devicons'} -- OPTIONAL: for file icons
  use {'lewis6991/gitsigns.nvim'} -- OPTIONAL: for git status


end)
