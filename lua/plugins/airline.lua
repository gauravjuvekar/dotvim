return {
  "vim-airline/vim-airline",
  lazy = false,
  priority = 1000,
  dependencies = {
    "vim-airline/vim-airline-themes",
    "ryanoasis/vim-devicons",
  },
  init = function()
    -- word count
    vim.g.airline = { extensions = { wordcount = { filetypes = "\vhelp|markdown|rst|org|text" } } }
    vim.g.airline_powerline_fonts = 1
  end,
}
