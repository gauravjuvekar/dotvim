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
