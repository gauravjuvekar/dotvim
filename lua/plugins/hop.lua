return {
  "smoka7/hop.nvim",
  config = function()
    require("hop").setup()

    local hop = require("hop")
    local hopts = require("hop-treesitter")

    vim.keymap.set("", "f", function() hop.hint_char1({}) end, {})
    vim.keymap.set("", "F", function() hop.hint_anywhere({}) end, {})
    vim.keymap.set("", "s", function() hopts.hint_nodes({}) end, {})
  end,
}
