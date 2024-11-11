-- Global clip board as +
-- Mouse buffer is *
vim.opt.clipboard = "unnamedplus"

-- https://superuser.com/a/321726/252728
-- delete or visual paste without yanking
vim.api.nvim_set_keymap("n", "<leader>d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>p", "p", { noremap = true })
