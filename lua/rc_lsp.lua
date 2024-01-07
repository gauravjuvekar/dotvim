local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {}

vim.g.coq_settings = {
	auto_start = 'shut-up'
}

local servers = {
	'bashls',
	'clangd',
	'lua_ls',
	'nixd',
	'perlnavigator',
	'phpactor',
	'pyright',
	'rust_analyzer',
	'vimls',
	'yamlls',
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({}))
end
