local fqdn = string.gsub(vim.fn.system('hostname -f'), "%s+", "")
if string.match(fqdn, [[%.nvidia%.com$]])
then
  return {
    "Exafunction/windsurf.vim",
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-a>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-s>', function () return vim.fn['codeium#AcceptNextLine']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  }
else
  return {}
end
