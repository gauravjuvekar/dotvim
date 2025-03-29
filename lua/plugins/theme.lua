return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {},
      palettes = {
        carbonfox = {
          -- set yellow/orange to actually be yellow/orange
          yellow = require("nightfox.palette").load("duskfox").yellow,
          orange = require("nightfox.palette").load("nightfox").orange,
        },
      },
      groups = {
        all = {
          -- better highlight for search results
          Search = { link = "IncSearch" },
          CurSearch = { fg = "palette.bg1", bg = "palette.cyan" },
        },
      },
    })
    vim.cmd("colorscheme carbonfox")
  end,
}
