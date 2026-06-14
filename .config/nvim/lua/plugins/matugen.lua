return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local c = require("colors.matugen")

      opts.options.theme = {
        normal = {
          a = { bg = c.green, fg = c.bg },
          b = { bg = c.cyan, fg = c.fg },
          c = { bg = c.bg, fg = c.fg },
        },
        insert = {
          a = { bg = c.blue, fg = c.bg },
        },
        visual = {
          a = { bg = c.magenta, fg = c.fg },
        },
        replace = {
          a = { bg = c.red, fg = c.bg },
        },
      }
    end,
  },
}
