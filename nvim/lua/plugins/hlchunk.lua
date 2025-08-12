return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          { fg = "#2DC3DF" },
        },
        use_treesitter = true,
      },
      line_num = {
        enable = true,
        style = {
          { fg = "#2DC3DF" },
        },
      },
      blank = {
        enable = true,
      },
    })
  end,
}
