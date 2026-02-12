require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- From previous setup
-- yank to clipboard (macOS pbcopy)
local function copy_to_pbcopy()
  local save_reg = vim.fn.getreg '"'
  local save_type = vim.fn.getregtype '"'
  vim.cmd 'normal! "zy'
  vim.fn.system('pbcopy', vim.fn.getreg 'z')
  vim.fn.setreg('"', save_reg, save_type)
end

-- clangd : hover + man page fallback
map("n", "K", function()
  local word = vim.fn.expand "<cword>"
  vim.lsp.buf.hover()
  vim.defer_fn(function()
    vim.cmd("silent! Man " .. word)
  end, 100)
end, { desc = "LSP Hover + Man page fallback" })

-- DevdocsOpen
map("n", "<leader>d", function()
  local word = vim.fn.expand "<cword>"
  local ok = pcall(vim.cmd, "DevdocsOpenFloat " .. word)
  if not ok then
    vim.cmd("Man " .. word)
  end
end, { desc = "DevDocs Float or Man page" })

-- visual mode copy to clipboard
map("v", ";cp", copy_to_pbcopy, { noremap = true, silent = true })

-- telescope
map("n", ";f", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
map("n", ";;", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
map("n", ";n", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", { noremap = true, silent = true })
map("n", ";r", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })

-- telescope-file-browser
map("n", ";F", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true })

-- neogit
map("n", ";g", "<cmd>Neogit<cr>", { noremap = true, silent = true })
map("n", ";gd", "<cmd>Neogit diff<cr>", { noremap = true, silent = true })
map("n", ";gl", "<cmd>Neogit log<cr>", { noremap = true, silent = true })
map("n", ";gc", "<cmd>Neogit commit<cr>", { noremap = true, silent = true })
map("n", ";gp", "<cmd>Neogit push<cr>", { noremap = true, silent = true })

-- tabufline buffer navigation (left-to-right order)
local function goto_tabufline_index(i)
  local bufs = vim.t.bufs
  if not bufs or not bufs[i] then
    return
  end
  require("nvchad.tabufline").goto_buf(bufs[i])
end

for i = 1, 9 do
  map("n", ";" .. i, function()
    goto_tabufline_index(i)
  end, { noremap = true, silent = true })
end

map("n", ";0", function()
  local bufs = vim.t.bufs
  if not bufs or #bufs == 0 then
    return
  end
  require("nvchad.tabufline").goto_buf(bufs[#bufs])
end, { noremap = true, silent = true })

map("n", ";,", function()
  require("nvchad.tabufline").prev()
end, { noremap = true, silent = true })

map("n", ";.", function()
  require("nvchad.tabufline").next()
end, { noremap = true, silent = true })

-- command palette / search
map("n", ";?", "<cmd>Legendary<cr>", { noremap = true, silent = true })
