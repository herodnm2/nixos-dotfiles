local c = require("colors.matugen")

vim.api.nvim_set_hl(0, "CursorLine", {
  bg = c.black,
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = c.green,
  bold = true,
})
