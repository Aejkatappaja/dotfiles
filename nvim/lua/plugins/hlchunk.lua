return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      -- fg colors are theme-switched by ~/.config/bin/theme (sed on the hex)
      chunk = {
        enable = true,
        style = {
          { fg = "#EA9875" },
        },
        use_treesitter = true,
      },
      line_num = {
        enable = true,
        style = {
          { fg = "#EA9875" },
        },
      },
      blank = {
        enable = true,
      },
    })
  end,
}
