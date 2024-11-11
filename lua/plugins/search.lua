return {
  {
    "chrisgrieser/nvim-rip-substitute",
    cmd = "RipSubstitute",
    keys = {
      {
        "<leader>r",
        function()
          require("rip-substitute").sub()
        end,
        mode = { "n", "x" },
        desc = "rip substitute",
      },
    },
    init = function()
      vim.keymap.set("ca", "R", "RipSubstitute", {remap = false})
    end,
  },
  {
    "tpope/vim-abolish",
    init = function()
      vim.keymap.set("ca", "S", "Subvert", {remap = false})
    end,
  },
}
