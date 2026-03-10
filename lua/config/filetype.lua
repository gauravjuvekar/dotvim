local group = vim.api.nvim_create_augroup('custom_filetypes', { clear = true })

local overrides = {
  ['*.html'] = 'htmldjango',
  ['*.sqlite3'] = 'sql',
  ['*.md'] = 'markdown',
  ['*.mk'] = 'make',
  ['*.nvmk'] = 'make',
  ['*.tt'] = 'tt2',
  ['SCon*'] = 'scons',
  ['*.finn'] = 'c.doxygen',
}

for pattern, ft in pairs(overrides) do
  vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.bo.filetype = ft
    end,
  })
end
