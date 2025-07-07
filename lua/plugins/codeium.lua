local fqdn = string.gsub(vim.fn.system('hostname -f'), "%s+", "")
if string.match(fqdn, [[%.nvidia%.com$]])
then
  return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function ()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
        server = {
          api_url = 'https://codeium-poc.hwinf-scm-aws.nvidia.com/_route/api_server',
          portal_url = 'https://codeium-poc.hwinf-scm-aws.nvidia.com',
        },
      })
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-a>', neocodeium.accept, { expr = true, silent = true })
      vim.keymap.set('i', '<C-s>', neocodeium.accept_line, { expr = true, silent = true })
      vim.keymap.set('i', '<c-j>', function() return neocodeium.cycle_or_complete(-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-l>', neocodeium.cycle_or_complete, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', neocodeium.clear, { expr = true, silent = true })
    end
  }
else
  return {}
end
