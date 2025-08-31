function ColorMyPencils(color)
  color = color or "rosepine-moon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return {
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   opts = {
  --     style = "night",
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  -- {
  --   "sainnhe/gruvbox-material",
  --   enabled = true,
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     -- Customisation avec les couleurs exactes de votre JSON
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       pattern = "gruvbox-material",
  --       callback = function()
  --         local function hi(group, opts)
  --           vim.api.nvim_set_hl(0, group, opts)
  --         end
  --
  --         -- Couleurs exactes de votre JSON
  --         local colors = {
  --           fg0 = "#d4be98", -- text principal
  --           fg1 = "#c5b18d", -- text.muted
  --           fg2 = "#928374", -- text.placeholder
  --           fg3 = "#7c6f64", -- comment color
  --
  --           -- Couleurs syntax exactes du JSON
  --           keyword = "#7daea3", -- keyword, attribute (bleu-vert)
  --           constructor = "#89b482", -- constructor, function, type (vert)
  --           property = "#ea6962", -- property (rouge)
  --           string = "#a9b665", -- string (vert jaunâtre)
  --           constant = "#d3869b", -- constant (rose/purple)
  --           number = "#ab6c7d", -- number, boolean (rose)
  --           operator = "#89b482", -- operator (vert)
  --
  --           -- Couleurs UI
  --           border = "#444343",
  --           active_line = "#32302f",
  --           search_bg = "#3b4439",
  --         }
  --
  --         -- Override complet des couleurs de syntaxe
  --         -- Mots-clés (import, export, const, function, if, return, etc.)
  --         hi("Statement", { fg = colors.keyword })
  --         hi("Conditional", { fg = colors.keyword })
  --         hi("Repeat", { fg = colors.keyword })
  --         hi("Label", { fg = colors.keyword })
  --         hi("Operator", { fg = colors.operator })
  --         hi("Keyword", { fg = colors.keyword })
  --         hi("Exception", { fg = colors.keyword })
  --         hi("Include", { fg = colors.keyword })
  --         hi("Define", { fg = colors.keyword })
  --         hi("Macro", { fg = colors.keyword })
  --         hi("PreCondit", { fg = colors.keyword })
  --         hi("PreProc", { fg = colors.keyword })
  --
  --         -- Types, constructeurs, fonctions
  --         hi("Type", { fg = colors.constructor })
  --         hi("StorageClass", { fg = colors.constructor })
  --         hi("Structure", { fg = colors.constructor })
  --         hi("Typedef", { fg = colors.constructor })
  --         hi("Function", { fg = colors.constructor })
  --         hi("Identifier", { fg = colors.constructor })
  --
  --         -- Propriétés et champs
  --         hi("Special", { fg = colors.property })
  --         hi("SpecialChar", { fg = colors.property })
  --         hi("Tag", { fg = colors.property })
  --
  --         -- Strings et caractères
  --         hi("String", { fg = colors.string })
  --         hi("Character", { fg = colors.string })
  --
  --         -- Nombres et constantes
  --         hi("Constant", { fg = colors.constant })
  --         hi("Number", { fg = colors.number })
  --         hi("Boolean", { fg = colors.number })
  --         hi("Float", { fg = colors.number })
  --
  --         -- Commentaires
  --         hi("Comment", { fg = colors.fg3, italic = true })
  --         hi("SpecialComment", { fg = colors.fg2, italic = true })
  --
  --         -- Tree-sitter overrides (plus spécifiques)
  --         -- Mots-clés
  --         hi("@keyword", { fg = colors.keyword })
  --         hi("@keyword.function", { fg = colors.keyword })
  --         hi("@keyword.operator", { fg = colors.keyword })
  --         hi("@keyword.return", { fg = colors.keyword })
  --         hi("@keyword.conditional", { fg = colors.keyword })
  --         hi("@keyword.repeat", { fg = colors.keyword })
  --         hi("@keyword.import", { fg = colors.keyword })
  --         hi("@keyword.export", { fg = colors.keyword })
  --         hi("@keyword.storage", { fg = colors.keyword })
  --
  --         -- Fonctions et types
  --         hi("@function", { fg = colors.constructor })
  --         hi("@function.builtin", { fg = colors.constructor })
  --         hi("@function.call", { fg = colors.constructor })
  --         hi("@constructor", { fg = colors.constructor })
  --         hi("@type", { fg = colors.constructor })
  --         hi("@type.builtin", { fg = colors.constructor })
  --         hi("@type.definition", { fg = colors.constructor })
  --
  --         -- Propriétés et variables
  --         hi("@property", { fg = colors.property })
  --         hi("@field", { fg = colors.property })
  --         hi("@variable.member", { fg = colors.property })
  --         hi("@parameter", { fg = colors.property })
  --
  --         -- Variables normales
  --         hi("@variable", { fg = colors.fg0 })
  --         hi("@variable.builtin", { fg = colors.keyword })
  --
  --         -- Strings
  --         hi("@string", { fg = colors.string })
  --         hi("@string.escape", { fg = colors.string })
  --         hi("@string.special", { fg = colors.string })
  --
  --         -- Nombres et constantes
  --         hi("@number", { fg = colors.number })
  --         hi("@boolean", { fg = colors.number })
  --         hi("@float", { fg = colors.number })
  --         hi("@constant", { fg = colors.constant })
  --         hi("@constant.builtin", { fg = colors.constant })
  --         hi("@constant.macro", { fg = colors.keyword })
  --
  --         -- Opérateurs
  --         hi("@operator", { fg = colors.operator })
  --
  --         -- Ponctuations
  --         hi("@punctuation.delimiter", { fg = colors.fg1 })
  --         hi("@punctuation.bracket", { fg = colors.fg1 })
  --         hi("@punctuation.special", { fg = colors.fg1 })
  --
  --         -- Tags (pour JSX/HTML)
  --         hi("@tag", { fg = colors.keyword })
  --         hi("@tag.attribute", { fg = colors.property })
  --         hi("@tag.delimiter", { fg = colors.fg1 })
  --
  --         -- Commentaires
  --         hi("@comment", { fg = colors.fg3, italic = true })
  --         hi("@comment.documentation", { fg = colors.fg2, italic = true })
  --
  --         -- Spécifiques aux langages
  --         -- JavaScript/TypeScript
  --         hi("@lsp.type.class", { fg = colors.constructor })
  --         hi("@lsp.type.type", { fg = colors.constructor })
  --         hi("@lsp.type.interface", { fg = colors.constructor })
  --         hi("@lsp.type.function", { fg = colors.constructor })
  --         hi("@lsp.type.method", { fg = colors.constructor })
  --         hi("@lsp.type.property", { fg = colors.property })
  --         hi("@lsp.type.variable", { fg = colors.fg0 })
  --         hi("@lsp.type.parameter", { fg = colors.property })
  --         hi("@lsp.type.keyword", { fg = colors.keyword })
  --         -- HTML: tags et attributs en bleu
  --         hi("htmlTag", { fg = colors.keyword, bold = true })
  --         hi("htmlEndTag", { fg = colors.keyword, bold = true })
  --         hi("htmlTagName", { fg = colors.keyword })
  --         hi("htmlSpecialTagName", { fg = colors.keyword })
  --         hi("htmlArg", { fg = colors.keyword })
  --         hi("htmlLink", { fg = colors.link, underline = true })
  --
  --         -- CSS: class/id en bleu
  --         hi("cssClassName", { fg = colors.keyword })
  --         hi("cssClassNameDot", { fg = colors.keyword })
  --         hi("cssIdentifier", { fg = colors.keyword })
  --
  --         -- Treesitter HTML/CSS
  --         hi("@tag", { fg = colors.keyword })
  --         hi("@tag.attribute", { fg = colors.keyword })
  --         hi("@tag.delimiter", { fg = colors.keyword, bold = true })
  --
  --         -- Sélecteurs CSS (selon la grammaire TS installée)
  --         hi("@selector.class.css", { fg = colors.keyword })
  --         hi("@selector.id.css", { fg = colors.keyword })
  --         hi("@selector.tag.css", { fg = colors.keyword })
  --         hi("@type.css", { fg = colors.keyword })
  --         hi("@type.qualifier.css", { fg = colors.keyword })
  --
  --         -- Force les couleurs d'interface
  --         hi("Normal", { fg = colors.fg0, bg = colors.bg0 })
  --         hi("LineNr", { fg = colors.bg4 })
  --         hi("CursorLineNr", { fg = colors.fg0 })
  --       end,
  --     })
  --
  --     vim.g.gruvbox_material_transparent_background = 1
  --     vim.g.gruvbox_material_foreground = "mix"
  --     vim.g.gruvbox_material_background = "hard"
  --     vim.g.gruvbox_material_ui_contrast = "high"
  --     vim.g.gruvbox_material_float_style = "bright"
  --     vim.g.gruvbox_material_statusline_style = "mix"
  --     vim.g.gruvbox_material_cursor = "auto"
  --
  --     ColorMyPencils("gruvbox-material")
  --   end,
  -- },
  -- {
  --   "sainnhe/everforest",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.everforest_enable_italic = false
  --     vim.g.everforest_transparent_background = 1
  --     ColorMyPencils("everforest")
  --   end,
  -- },
  -- {
  --   "sainnhe/gruvbox-material",
  --   enabled = true,
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     vim.g.gruvbox_material_transparent_background = 1
  --     vim.g.gruvbox_material_foreground = "mix"
  --     vim.g.gruvbox_material_background = "hard"
  --     vim.g.gruvbox_material_ui_contrast = "high"
  --     vim.g.gruvbox_material_float_style = "bright"
  --     vim.g.gruvbox_material_statusline_style = "mix" -- Options: "original", "material", "mix", "afterglow"
  --     vim.g.gruvbox_material_cursor = "auto"
  --     ColorMyPencils("gruvbox-material")
  --   end,
  -- },
  -- {
  -- {
  --   "vague2k/vague.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other plugins
  --   config = function()
  --     -- NOTE: you do not need to call setup if you don't want to.
  --     require("vague").setup({
  --       transparent = true,
  --       -- optional configuration here
  --       colors = {
  --         floatBorder = "#252530",
  --       },
  --     })
  --     vim.cmd("colorscheme vague")
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
    lazy = false,
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
      colorscheme = "rose-pine",
    },
  },
}
