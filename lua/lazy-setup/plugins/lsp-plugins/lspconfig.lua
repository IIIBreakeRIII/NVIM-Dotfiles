local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the "vim" global
        globals = { "vim" },
      }
    }
  }
})

require("lspconfig")['clangd'].setup({})
require("lspconfig")['html'].setup({
  cmd = { "vscode-html-language-server", "--stdio" },
})
-- require("lspconfig")['cssls'].setup({
--   cmd = { "vscode-css-language-server", "--stdio" },
-- })
require("lspconfig")['jsonls'].setup({
  cmd = { "vscode-json-language-server", "--stdio" },
})
require("lspconfig")['eslint'].setup({
  cmd = { "vscode-eslint-language-server", "--stdio" },
})
require("lspconfig")['ts_ls'].setup({})

-- require('lspconfig')['tailwindcss'].setup({
--   capabilities = capabilities
-- })
-- 
-- require("lspconfig")["lua_ls"].setup({ capabilities = capabilities })
-- require("lspconfig")["pyright"].setup({ capabilities = capabilities })


return {}
