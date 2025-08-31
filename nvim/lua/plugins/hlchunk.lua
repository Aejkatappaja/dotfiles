return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          { fg = "#F9B34C" },
        },
        use_treesitter = true,
      },
      line_num = {
        enable = true,
        style = {
          { fg = "#F9B34C" },
        },
      },
      blank = {
        enable = true,
      },
    })
  end,
}
