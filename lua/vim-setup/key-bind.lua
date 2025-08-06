-- This Space is for Key-Binding

-- personal use
-- yank to clipboard
local function copy_to_pbcopy()
  local save_reg   = vim.fn.getreg('"')
  local save_type  = vim.fn.getregtype('"')
  vim.cmd('normal! "zy')
  vim.fn.system('pbcopy', vim.fn.getreg('z'))
  vim.fn.setreg('"', save_reg, save_type)
end

-- clangd : hover + man page fallback
vim.keymap.set('n', 'K', function()
  local word = vim.fn.expand('<cword>')
  -- LSP hover 시도
  vim.lsp.buf.hover()
  -- man page 열기 (비동기로)
  vim.defer_fn(function()
    vim.cmd('silent! Man ' .. word)
  end, 100)
end, { desc = "LSP Hover + Man page fallback" })

-- cland : DevdocsOpen
vim.keymap.set('n', '<leader>d', function()
  local word = vim.fn.expand('<cword>')
  local ok = pcall(vim.cmd, 'DevdocsOpenFloat ' .. word)
  if not ok then
    vim.cmd('Man ' .. word)
  end
end, { desc = "DevDocs Float or Man page" })

-- visual 모드에서 ;cp 누르면 위 함수 실행
vim.keymap.set('v', ';cp', copy_to_pbcopy, { noremap = true, silent = true })
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

-- Disassemble / Decompile
vim.api.nvim_set_keymap('n', ';da', [[<cmd>ReCDisasm<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';dc', [[<cmd>ReCDecompile<cr>]], {noremap=true, silent=true})
