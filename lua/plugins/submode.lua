return {
  "kana/vim-submode",
  config = function()
    -- Configure submodes so as to not press ctrl + W for every split adjustment
    vim.api.nvim_call_function(
      "submode#enter_with",
      { "window", "n", "", "<C-w>" }
    )
    vim.api.nvim_call_function(
      "submode#leave_with",
      { "window", "n", "", "<ESC>" }
    )

    local chars = {
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z",
    }

    for i, key in pairs(chars) do
      vim.api.nvim_call_function(
        "submode#map",
        { "window", "n", "", key, "<C-w>" .. key }
      )
      vim.api.nvim_call_function(
        "submode#map",
        { "window", "n", "", string.upper(key), "<C-w>" .. string.upper(key) }
      )
      vim.api.nvim_call_function(
        "submode#map",
        {
          "window",
          "n",
          "",
          "<C-" .. key .. ">",
          "<C-w>" .. "<C-" .. key .. ">",
        }
      )
      vim.api.nvim_call_function(
        "submode#map",
        {
          "window",
          "n",
          "",
          "<C-" .. string.upper(key) .. ">",
          "<C-w>" .. "<C-" .. string.upper(key) .. ">",
        }
      )
    end

    local specials = { "=", "_", "+", "-", "<", ">", "{", "}", "[", "]" }
    for i, key in pairs(specials) do
      vim.api.nvim_call_function(
        "submode#map",
        { "window", "n", "", key, "<C-w>" .. key }
      )
    end
  end,
}
