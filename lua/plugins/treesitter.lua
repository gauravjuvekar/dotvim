return {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "bash",
          "c",
          "comment",
          "cpp",
          "css",
          "csv",
          "diff",
          "dockerfile",
          "dot",
          "doxygen",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "gpg",
          "html",
          "htmldjango",
          "http",
          "ini",
          "javascript",
          "jq",
          "json",
          "json5",
          "linkerscript",
          "lua",
          "luadoc",
          "make",
          "markdown",
          "markdown_inline",
          "nix",
          "objdump",
          "passwd",
          "perl",
          "php",
          "phpdoc",
          "proto",
          "python",
          "query",
          "regex",
          "requirements",
          "rust",
          "sql",
          "ssh_config",
          "strace",
          "toml",
          "tsv",
          "udev",
          "verilog",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
          "zig",
        },
        autotag = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        -- pairs = {
        --   enable = true,
        --   highlight_self = false,
        --   goto_right_end = false,
        --   fallback_cmd_normal = "normal! %",
        --   keymaps = {
        --     goto_partner = "<leader>%",
        --     delete_balanced = "X",
        --   },
        --   delete_balanced = {
        --     only_on_first_char = false,
        --     fallback_cmd_normal = nil,
        --     longest_partner = true,
        --   },
        -- },
        matchup = {
          enable = true,
        },
      })
    end,
  },
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
    end
  },
  -- {
  --   "theHamsta/nvim-treesitter-pairs",
  -- },
}
