local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        lua = { "stylua" },
        python = { "isort", "yapf" },
        rust = { "rustfmt" },
    },
    formatters = {
        stylua = {
            prepend_args = {
                "--indent-type",
                "Spaces",
                "--column-width",
                "80",
                "--sort-requires",
            },
        },
    },
})

vim.keymap.set({ "n", "v" }, "<c-k>", conform.format, {})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
