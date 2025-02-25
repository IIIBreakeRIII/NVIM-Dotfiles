-- 파일: lua/lazy-setup/lazy.lua

-- 부트스트랩 코드 (기존 코드)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.fn.empty(vim.fn.glob(lazypath)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim 설정: 각 그룹별 init.lua를 import
require("lazy").setup({
  { import = "lazy-setup.plugins.dev-plugins" },
  { import = "lazy-setup.plugins.lsp-plugins" },
  { import = "lazy-setup.plugins.ui-plugins" },
})
