require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright" }
if vim.lsp.enable then
  vim.lsp.enable(servers)
else
  local lspconfig = require "lspconfig"
  for _, server in ipairs(servers) do
    lspconfig[server].setup {}
  end
end

-- read :h vim.lsp.config for changing options of lsp servers 
