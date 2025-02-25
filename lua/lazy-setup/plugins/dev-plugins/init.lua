return {
  
  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup{
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" },
        },
      }
    end,
  },

  -- telescope-file-browser
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- lexima.vim - brackets auto pair
  {
    'cohama/lexima.vim',
  },
  
  -- gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup{
        defaults = {}
      }
    end
  }

}
