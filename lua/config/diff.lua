-- 3 way merge commands
vim.api.nvim_set_keymap("n", "ml", ":diffget LOCAL<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "mb", ":diffget BASE<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "mr", ":diffget REMOTE<cr>", { noremap = true })

local group = vim.api.nvim_create_augroup("diffMode", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = group,
  callback = function()
    if vim.api.nvim_win_get_option(0, "diff") then
      vim.wo.wrap = true
    end
  end,
})
