function ColorMyPencils(color)
  color = color or "rosepine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        extend_background_behind_borders = true,
        variant = "moon",
        styles = {
          sidebars = "transparent",
          floats = "transparent",
          bold = false,
          italic = false,
          transparency = true,
        },
      })
      ColorMyPencils("rose-pine")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = "auto"
    end,
  },
  {
    "aejkatappaja/cendre",
    name = "cendre",
    lazy = false,
    priority = 1000,
    config = function()
      require("cendre").setup({
        background = "hard",
        dim_inactive = true,
        transparent = true,
      })
    end,
  },
  {
    "aejkatappaja/sora",
    name = "sora",
    lazy = false,
    priority = 1000,
    config = function()
      require("sora").setup({ transparent = true, italic = false })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cendre",
    },
  },
}
