function ColorMyPencils(color)
  color = color or "rosepine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

local transparent = true
local bg_highlight = "#143652"

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
      transparent = transparent,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg_float = "NONE"
        colors.bg_highlight = bg_highlight
        colors.bg_sidebar = "NONE"
        colors.bg_statusline = "NONE"
      end,
    },
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = true,
    config = function()
      vim.o.background = "dark"

      local cmds = {
        "let g:gruvbox_material_background = 'hard'",
        "let g:gruvbox_material_transparent_background = 2",
        "let g:gruvbox_material_diagnostic_line_highlight = 1",
        "let g:gruvbox_material_diagnostic_virtual_text = 'colored'",
        "let g:gruvbox_material_enable_bold = 1",
        "let g:gruvbox_material_enable_italic = 1",
      }

      for _, cmd in ipairs(cmds) do
        vim.cmd(cmd)
      end
    end,
  },
  {
    "vague2k/vague.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("vague").setup({
        -- optional configuration here
        transparent = true,
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "none",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "none",
          variables = "none",

          -- keywords
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        colors = {
          floatBorder = "#252530",
        },
      })
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
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false,
        terminal = true,
        overrides = {
          Normal = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          FloatTitle = { bg = "NONE" },
          StatusLine = { bg = "NONE" },
          StatusLineNC = { bg = "NONE" },
          TabLineFill = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          WinBar = { bg = "NONE" },
          WinBarNC = { bg = "NONE" },
        },
      })
    end,
  },
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- transparent = true,
      flat_ui = false,
      on_highlights = function(hl, c)
        hl.NormalFloat = { fg = c.foreground, bg = "NONE" }
        hl.FloatBorder = { fg = c.grey_one, bg = "NONE" }
        hl.FloatTitle = { fg = c.biloba_flower, bg = "NONE", bold = true }
        hl.StatusLine = { fg = c.foreground, bg = "NONE" }
        hl.StatusLineNC = { fg = c.silver, bg = "NONE" }
        hl.TabLineFill = { bg = "NONE" }
      end,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local theme = require("lualine.themes.jellybeans-nvim")
      for _, mode in pairs(theme) do
        if mode.b then
          mode.b.bg = "NONE"
        end
        if mode.c then
          mode.c.bg = "NONE"
        end
      end
      opts.options = opts.options or {}
      opts.options.theme = theme
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
      colorscheme = "sora",
    },
  },
}
