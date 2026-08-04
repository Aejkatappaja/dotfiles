return {
  {
    "folke/noice.nvim",
    opts = {
      -- Noice owns hover and signature help, and its popup view ships
      -- border.style = "none", so it ignores vim.o.winborder.
      views = {
        hover = { border = { style = "rounded" } },
      },
    },
  },
}
