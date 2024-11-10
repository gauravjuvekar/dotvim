return {
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    vim.g.coq_settings = {
        auto_start = false, -- if you want to start COQ at startup
        -- Your COQ settings here
    }
  end,
  config = function()
    local lspconfig = require("lspconfig")
    local jsonls_capabilities = vim.lsp.protocol.make_client_capabilities()
    jsonls_capabilities.textDocument.completion.completionItem.snippetSupport = true

    local servers = {
        ["bashls"] = {},
        ["clangd"] = {},
        ["jsonls"] = {
            cmd = {
                "vscode-json-languageserver",
                "--stdio"
            },
            capabilities = jsonls_capabilities,
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
                "--stdio"
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
}
