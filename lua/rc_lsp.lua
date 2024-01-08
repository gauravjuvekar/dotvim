local lspconfig = require("lspconfig")

lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})

vim.g.coq_settings = {
    auto_start = "shut-up",
}

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
