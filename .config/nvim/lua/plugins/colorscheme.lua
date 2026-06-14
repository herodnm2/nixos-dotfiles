return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local c = require("colors.matugen")

        vim.cmd("highlight clear")
        vim.cmd("syntax reset")

        vim.o.background = "dark"
        vim.g.colors_name = "matugen"

        vim.api.nvim_set_hl(0, "Normal", {
          fg = c.fg,
          bg = c.bg,
        })

        vim.api.nvim_set_hl(0, "NormalFloat", {
          fg = c.fg,
          bg = c.black,
        })

        vim.api.nvim_set_hl(0, "FloatBorder", {
          fg = c.green,
          bg = c.black,
        })

        vim.api.nvim_set_hl(0, "CursorLine", {
          bg = c.black,
        })

        vim.api.nvim_set_hl(0, "CursorLineNr", {
          fg = c.green,
          bold = true,
        })

        vim.api.nvim_set_hl(0, "LineNr", {
          fg = c.cyan,
        })

        vim.api.nvim_set_hl(0, "Comment", {
          fg = c.cyan,
          italic = true,
        })

        vim.api.nvim_set_hl(0, "String", {
          fg = c.green,
        })

        vim.api.nvim_set_hl(0, "Function", {
          fg = c.blue,
        })

        vim.api.nvim_set_hl(0, "Keyword", {
          fg = c.magenta,
        })
      end,
    },
  },
}
