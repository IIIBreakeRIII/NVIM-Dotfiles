local lspsaga = require("lspsaga")

local opts = { noremap = true, silent = true }

lspsaga.setup({
  vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts),
})

return {}
