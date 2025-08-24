-- return {
--   "echasnovski/mini.icons",
--   opts = {
--     extension = {
--       go = { glyph = "", hl = "MiniIconsAzure" },
--     },
--     file = {
--       ["go.mod"] = { glyph = "", hl = "MiniIconsAzure" },
--       ["go.sum"] = { glyph = "", hl = "MiniIconsAzure" },
--     },
--   },
-- }
return {
  "echasnovski/mini.icons",
  opts = function(_, opts)
    opts = opts or {}
    opts.extension = vim.tbl_deep_extend("force", opts.extension or {}, {
      go = { glyph = "", hl = "GoIcon" },
    })
    opts.file = vim.tbl_deep_extend("force", opts.file or {}, {
      ["go.mod"] = { glyph = "", hl = "GoIcon" },
      ["go.sum"] = { glyph = "", hl = "GoIcon" },
    })
    return opts
  end,
  config = function(_, opts)
    require("mini.icons").setup(opts)

    local function set_go_icon_hl()
      vim.api.nvim_set_hl(0, "GoIcon", { fg = "#7AD4FD" }) -- ta couleur
    end
    set_go_icon_hl()
    -- Si tu changes de colorscheme, réapplique le highlight
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_go_icon_hl,
    })
  end,
}
