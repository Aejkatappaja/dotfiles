function ColorMyPencils(color)
  color = color or "rosepine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true, -- enable transparent floating windows
      },
      no_italic = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        -- keywords = { italic = false },
        -- functions = { italic = false },
        -- variables = { italic = false },
      },
    },
  },
  {
    "sainnhe/gruvbox-material",
    priority = 2000,
    lazy = true,
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "original" -- Options: "original", "material", "mix", "afterglow"
      vim.g.gruvbox_material_cursor = "auto"
    end,
  },
  {
    "vague2k/vague.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = true,
        colors = {
          floatBorder = "#252530",
        },
      })
      ColorMyPencils("vague")
    end,
  },
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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
