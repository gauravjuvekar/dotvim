return {
  "chrisgrieser/nvim-spider",
  lazy = true,
  keys = {
    {
      "<leader>w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
    },
    {
      "<leader>e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
    },
    {
      "<leader>b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
    },
  },
}
