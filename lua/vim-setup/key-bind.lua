-- This Space is for Key-Binding

-- telescope
vim.api.nvim_set_keymap('n', ';f', [[<cmd>Telescope find_files<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';;', [[<cmd>Telescope help_tags<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '\\', [[<cmd>Telescope buffers<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';r', [[<cmd>Telescope live_grep<cr>]], {noremap=true, silent=true})

-- telescope-file_browsers
vim.api.nvim_set_keymap('n', ';F', [[<cmd>Telescope file_browser<cr>]], {noremap=true, silent=true})

-- Bufferline
vim.api.nvim_set_keymap('n', ';1', [[<cmd>BufferLineGoToBuffer 1<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';2', [[<cmd>BufferLineGoToBuffer 2<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';3', [[<cmd>BufferLineGoToBuffer 3<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';4', [[<cmd>BufferLineGoToBuffer 4<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';5', [[<cmd>BufferLineGoToBuffer 5<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';6', [[<cmd>BufferLineGoToBuffer 6<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';7', [[<cmd>BufferLineGoToBuffer 7<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';8', [[<cmd>BufferLineGoToBuffer 8<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';9', [[<cmd>BufferLineGoToBuffer 9<cr>]], {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<A-.>', [[<cmd>BufferLineCycleNext<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<A-,>', [[<cmd>BufferLineCyclePrev<cr>]], {noremap=true, silent=true})

-- neogit key binding
vim.api.nvim_set_keymap('n', ';g', [[<cmd>Neogit<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';gd', [[<cmd>Neogit diff<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';gl', [[<cmd>Neogit log<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';gc', [[<cmd>Neogit commit<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';gp', [[<cmd>Neogit push<cr>]], {noremap=true, silent=true})
