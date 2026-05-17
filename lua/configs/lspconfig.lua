require("nvchad.configs.lspconfig").defaults()

-- Ignore Python line-length warnings (E501) from linting-capable LSP servers.
-- This keeps other diagnostics intact while removing noisy style-only warnings.
local orig_publish_diagnostics = vim.lsp.handlers["textDocument/publishDiagnostics"]
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  if result and result.diagnostics and ctx and ctx.client_id then
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if client and (client.name == "ruff" or client.name == "ruff_lsp" or client.name == "pylsp") then
      result.diagnostics = vim.tbl_filter(function(diag)
        local code = diag.code
        if type(code) == "table" then code = code.value end
        return code ~= "E501" and code ~= 501
      end, result.diagnostics)
    end
  end

  return orig_publish_diagnostics(err, result, ctx, config)
end

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
