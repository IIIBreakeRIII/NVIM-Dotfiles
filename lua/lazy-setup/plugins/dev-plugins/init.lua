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

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  
  -- gitsigns.nvim
  -- neogit.nvim
  -- init.lua
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.defer_fn(function()
        require("gitsigns")
      end, 0)
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "echasnovski/mini.pick",
      "folke/snacks.nvim",
    }
  },

  {
    'andweeb/presence.nvim',
    config = function()
      -- The setup config table shows all available config options with their default values:
        require("presence").setup({
            -- General options
            auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
            neovim_image_text   = "FANTASTIC Editor for Developer", -- Text displayed when hovered over the Neovim image
            main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
            client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
            log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
            debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
            enable_line_number  = false,                      -- Displays the current line number instead of the current project
            blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
            buttons             = false,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
            file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
            show_time           = true,                       -- Show the timer
            -- Rich Presence text options
            editing_text        = "Wanna Contact : DM to Me",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
            file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
            git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
            plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
            reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
            workspace_text      = "Secret Dir.",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
            line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        })
    end
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  }

}
