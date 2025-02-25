return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup{
        defaults = {},
      }
    end
  },
  -- {
  --   'nanozuki/tabby.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   event = "BufReadPre",
  --   config = function()
  --     require("tabby")
  --   end,
  -- },
  {
    "akinsho/bufferline.nvim",
    tag = "v4.9.1",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline")
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl")
    end
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      require("rainbow-delimiters")
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = false, -- set background to transparent
      gamma = 1.30, -- adjust the brightness of the theme
      styles = {
          comments = { italic = true }, -- style for comments
          keywords = { italic = true }, -- style for keywords
          identifiers = { italic = true }, -- style for identifiers
          functions = {}, -- style for functions
          variables = {}, -- style for variables
      },
      custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
      custom_palette = {} or function(palette) return {} end, -- extend palette
      terminal_colors = true, -- enable terminal colors
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      vim.cmd [[colorscheme tokyodark]]
    end,
  },
}
