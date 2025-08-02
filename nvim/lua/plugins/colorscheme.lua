return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = true,
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd("let g:gruvbox_material_background='hard'")
      vim.cmd("let g:gruvbox_material_transparent_background=2")
      vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
      vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
      vim.cmd("let g:gruvbox_material_enable_bold=1")
      vim.cmd("let g:gruvbox_material_enable_italic=1")
      -- vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        extend_background_behind_borders = true,
        variant = "main", -- Choisissez le variant approprié
        disable_background = true, -- Pour la transparence
        styles = {
          sidebars = "transparent", -- Pour les barres latérales
          floats = "transparent", -- Pour les fenêtres flottantes
          bold = true,
          italic = false,
          transparency = true,
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
