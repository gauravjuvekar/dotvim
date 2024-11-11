return {
  {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim", branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { "ms-jpq/coq.thirdparty", branch = "3p" },
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = "shut-up",
        keymap = {
          recommended = false,
          jump_to_mark = "<c-l>",
        },
      }

      -- keybinds unrelated to nvim-autopairs. CR and BS have special handling in
      -- autopairs.lua to avoid them stepping on each other
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

      vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
        end,
      })
    end,
    config = function()
      local lspconfig = require("lspconfig")
      local jsonls_capabilities = vim.lsp.protocol.make_client_capabilities()
      jsonls_capabilities.textDocument.completion.completionItem.snippetSupport =
        true

      local servers = {
        ["bashls"] = {},
        ["clangd"] = {},
        ["jsonls"] = {
          cmd = {
            "vscode-json-languageserver",
            "--stdio",
          },
          capabilities = jsonls_capabilities,
        },
        ["ltex"] = {
          cmd = { "ltex-ls" },
          filetypes = { "markdown", "text", "email" },
        },
        ["lua_ls"] = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  "vim",
                },
              },
            },
          },
        },
        ["nixd"] = {},
        ["perlnavigator"] = {
          cmd = {
            "perlnavigator",
            "--stdio",
          },
        },
        ["phpactor"] = {},
        ["pyright"] = {},
        ["rust_analyzer"] = {},
        ["vimls"] = {},
        ["yamlls"] = {},
      }

      for lsp, conf in pairs(servers) do
        lspconfig[lsp].setup(require("coq").lsp_ensure_capabilities(conf))
      end
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      symbol_in_winbar = {
        show_file = false,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
