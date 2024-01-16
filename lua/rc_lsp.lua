local lspconfig = require("lspconfig")

lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})

local servers = {
    ["bashls"] = {},
    ["clangd"] = {},
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
    ["perlnavigator"] = {},
    ["phpactor"] = {},
    ["pyright"] = {},
    ["rust_analyzer"] = {},
    ["vimls"] = {},
    ["yamlls"] = {},
}

for lsp, conf in ipairs(servers) do
    lspconfig[lsp].setup(require("coq").lsp_ensure_capabilities(conf))
end
