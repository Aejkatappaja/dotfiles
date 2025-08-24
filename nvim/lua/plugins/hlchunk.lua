return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          { fg = "#3F8FB0" },
        },
        use_treesitter = true,
      },
      line_num = {
        enable = true,
        style = {
          { fg = "#3F8FB0" },
        },
      },
      blank = {
        enable = true,
      },
    })
  end,
}
