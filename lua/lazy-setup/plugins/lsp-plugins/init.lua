return {
  -- mason.nvim
  {
    "williamboman/mason.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("mason").setup{
        defaults = {}
      }
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- auto completion
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    config = function()
      require("cmp").setup{
        defaults = {}
      }
    end
  },

  {
    'onsails/lspkind.nvim',
    config = function()
      require("lspkind").setup{}
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

  },

  -- lspsaga
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup{}
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },

  -- LSP SERVER SETUP --
  -- {
  --   config = function ()
  --     require("lsp-server.html").setup{}
  --   end
  -- }
}
