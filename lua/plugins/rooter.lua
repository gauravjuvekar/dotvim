return {
  "airblade/vim-rooter",
  init = function()
    vim.g.rooter_manual_only = 1
    vim.g.rooter_patterns = { "Rakefile", ".git/", ".root" }
    vim.opt.autochdir = true
  end,
}
