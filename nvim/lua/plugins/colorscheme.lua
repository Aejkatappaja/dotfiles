function ColorMyPencils(color)
  color = color or "rosepine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return {
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
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        transparent = true,
        -- optional configuration here
        colors = {
          floatBorder = "#252530",
        },
      })
      ColorMyPencils("vague")
    end,
  },
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").setup({
  --       transparent = {
  --         -- Enable transparent background.
  --         bg = true,
  --         -- Enable transparent background for floating windows.
  --         float = true,
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       extend_background_behind_borders = true,
  --       variant = "moon", -- Choisissez le variant approprié
  --       disable_background = true, -- Pour la transparence
  --       styles = {
  --         sidebars = "transparent", -- Pour les barres latérales
  --         floats = "transparent", -- Pour les fenêtres flottantes
  --         bold = true,
  --         italic = false,
  --         transparency = true,
  --       },
  --     })
  --   end,
  -- },
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
          bold = true,
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
