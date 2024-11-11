return {
  {
    "javiorfo/nvim-soil",
    dependencies = { "aklt/plantuml-syntax" },
    lazy = true,
    ft = "plantuml",
    opts = {
      puml_jar = nil,
      image = {
        darkmode = false,
        format = "svg",
        execute_to_open = function(img)
          return "xdg-open " .. img
        end,
      },
    },
  },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "tyru/open-browser.vim",
      "aklt/plantuml-syntax",
    },
  },
}
