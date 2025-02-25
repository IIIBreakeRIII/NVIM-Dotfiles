-- 1. nvim-cmp 설정
local cmp = require("cmp")

local kind_format = require("lspkind").cmp_format({
  mode = "symbol_text",
  preset = "default",  -- 'default'로 설정하면 preset 색상이 적용되지 않습니다.
  maxwidth = 50,
})


cmp.setup({
  snippet = {
    -- 반드시 snippet 엔진을 지정해야 합니다.
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)  -- vsnip 사용 예제
    end,
  },
  window = {
    -- completion 창에 추가 옵션 적용
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
      -- 기존 border 옵션을 원한다면 아래와 같이 설정할 수도 있습니다.
      -- border = "rounded",
    },
    -- documentation 창은 bordered 설정 사용
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = kind_format(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"
      return kind
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    -- insert mode snippet 불러오기
    -- cmp.mapping.preset.insert(mapping_table?)
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  }),
})

-- 2. Git 관련 설정 (원하는 경우 주석 해제하여 사용)
--[[
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})
require("cmp_git").setup()
]]--

-- 3. cmdline 모드에서의 설정
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})

-- 4. LSP와 연동하기 위한 capabilities 설정
local capabilities = require("cmp_nvim_lsp").default_capabilities()


-- LSP 불러오기
-- require("lspconfig")["lsp-name"].setup({ capabilities = capabilities })

require("lspconfig")["lua_ls"].setup({ capabilities = capabilities })
require("lspconfig")["pyright"].setup({ capabilities = capabilities })
require("lspconfig")["tailwindcss"].setup({ capabilities = capabilities, on_attach = function(client, bufnr) end })

return {}
