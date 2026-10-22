return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      parsers = {
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
        "systemverilog",
        "toml",
        "tsv",
        "udev",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zig",
      },
    },
    config = function(_, opts)
      local treesitter = require("nvim-treesitter")
      treesitter.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
      vim.treesitter.language.register(
        "systemverilog",
        { "systemverilog", "verilog" }
      )
      treesitter.install(opts.parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
          if not lang or not vim.treesitter.language.add(lang) then
            return
          end
          vim.treesitter.start(ev.buf, lang)
          if vim.treesitter.query.get(lang, "indents") then
            vim.bo[ev.buf].indentexpr =
              "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
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
}
