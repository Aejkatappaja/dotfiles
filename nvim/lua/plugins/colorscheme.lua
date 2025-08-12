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
      },
    },
  },
  -- {
  --   "sainnhe/gruvbox-material",
  --   priority = 1000,
  --   lazy = true,
  --   config = function()
  --     vim.o.background = "dark" -- or "light" for light mode
  --     vim.cmd("let g:gruvbox_material_background='hard'")
  --     vim.cmd("let g:gruvbox_material_transparent_background=2")
  --     vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
  --     vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
  --     vim.cmd("let g:gruvbox_material_enable_bold=1")
  --     vim.cmd("let g:gruvbox_material_enable_italic=1")
  --     -- vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
  --   end,
  -- },
  -- {
  --   {
  --     "vague2k/vague.nvim",
  --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --     priority = 1000, -- make sure to load this before all the other plugins
  --     config = function()
  --       -- NOTE: you do not need to call setup if you don't want to.
  --       require("vague").setup({
  --         -- transparent = true,
  --         -- optional configuration here
  --       })
  --       vim.cmd("colorscheme vague")
  --     end,
  --   },
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        extend_background_behind_borders = true,
        variant = "moon", -- Choisissez le variant approprié
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
