return {
  'stevearc/conform.nvim',
  init = function ()
    vim.keymap.set({ "n", "v" }, "<c-k>", require("conform").format, {})
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  opts = {
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
  },
}
