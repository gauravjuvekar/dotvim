return {
  "junegunn/vim-easy-align",

  init = function()
    vim.g.easy_align_delimiters = { ["\\"] = { ["pattern"] = "\\$" } }
    vim.api.nvim_set_keymap(
      "v",
      "<enter>",
      "<Plug>(EasyAlign)",
      { noremap = true }
    )
  end,
}
