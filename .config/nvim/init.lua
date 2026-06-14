-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").nixd.setup({})
local colors = require("colors.matugen")

vim.api.nvim_set_hl(0, "Normal", {
  bg = colors.bg,
  fg = colors.fg,
})

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({})
