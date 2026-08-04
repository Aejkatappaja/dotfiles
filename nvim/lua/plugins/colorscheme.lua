function ColorMyPencils(color)
  color = color or "rosepine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = true,
    config = function()
      vim.o.background = "dark"

      local cmds = {
        "let g:gruvbox_material_background = 'hard'",
        "let g:gruvbox_material_foreground = 'original'",
        "let g:gruvbox_material_transparent_background = 2",
        "let g:gruvbox_material_diagnostic_line_highlight = 1",
        "let g:gruvbox_material_diagnostic_virtual_text = 'colored'",
        "let g:gruvbox_material_enable_bold = 1",
        "let g:gruvbox_material_enable_italic = 1",
      }

      for _, cmd in ipairs(cmds) do
        vim.cmd(cmd)
      end

      -- Kill leftover beige bg blocks on plugin float/title groups (bg only, keep fg)
      local function clear_bg(group)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if not ok then
          return
        end
        hl.bg = nil
        hl.ctermbg = nil
        vim.api.nvim_set_hl(0, group, hl)
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox-material",
        callback = function()
          -- NormalFloat/FloatBorder are owned by init.lua (dark #1E2021), left alone here
          local groups = {
            "FloatTitle",
            "SnacksPicker",
            "SnacksPickerBorder",
            "SnacksPickerTitle",
            "SnacksPickerBoxTitle",
            "SnacksPickerInput",
            "SnacksPickerInputTitle",
            "SnacksPickerList",
            "SnacksPickerPreview",
            "WhichKey",
            "WhichKeyNormal",
            "WhichKeyBorder",
            "WhichKeyTitle",
            "WhichKeyValue",
          }
          for _, g in ipairs(groups) do
            clear_bg(g)
          end

          -- dashboard: shortcut keys red, labels/icons cream (like the reference config)
          vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#ea6962" })
          vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#d4be98" })
          vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#d4be98" })

          -- blink.cmp: opaque dark menu (no bleed-through), subtle selection instead of beige
          vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#1e2021" })
          vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#504945", bg = "#1e2021" })
          vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#1e2021" })
          vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#504945", bg = "#1e2021" })
          vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#45403d" })
        end,
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
        -- transparent = true,
        background = "hard",
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
