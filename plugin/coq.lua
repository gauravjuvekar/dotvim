vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = false,
        jump_to_mark = "<c-l>",
    },
}

-- keybinds unrelated to nvim-autopairs.
-- CR and BS have special handling in autopairs.lua to avoid them stepping on
-- each other
vim.api.nvim_set_keymap(
    "i",
    "<esc>",
    [[pumvisible() ? "<c-e><esc>" : "<esc>"]],
    { expr = true, noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<c-c>",
    [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]],
    { expr = true, noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<tab>",
    [[pumvisible() ? "<c-n>" : "<tab>"]],
    { expr = true, noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<s-tab>",
    [[pumvisible() ? "<c-p>" : "<bs>"]],
    { expr = true, noremap = true, silent = true }
)
