return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {},
    })
    vim.cmd("colorscheme carbonfox")
  end,
}
