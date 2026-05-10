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
  "nvim-mini/mini.icons",
  opts = function(_, opts)
    opts = opts or {}
    opts.extension = vim.tbl_deep_extend("force", opts.extension or {}, {
      go = { glyph = "", hl = "GoIcon" },
      rs = { glyph = "", hl = "RustIcon" },
    })
    opts.file = vim.tbl_deep_extend("force", opts.file or {}, {
      ["go.mod"] = { glyph = "", hl = "GoIcon" },
      ["go.sum"] = { glyph = "", hl = "GoIcon" },
      ["Cargo.toml"] = { glyph = "", hl = "RustIcon" },
      ["Cargo.lock"] = { glyph = "", hl = "RustIcon" },
    })
    return opts
  end,
  config = function(_, opts)
    require("mini.icons").setup(opts)

    local function set_go_icon_hl()
      vim.api.nvim_set_hl(0, "GoIcon", { fg = "#7AD4FD" }) -- ta couleur
    end
    local function set_rust_icon_hl()
      vim.api.nvim_set_hl(0, "RustIcon", { fg = "#dea584" })
    end
    set_go_icon_hl()
    set_rust_icon_hl()
    -- Si tu changes de colorscheme, réapplique le highlight
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        set_go_icon_hl()
        set_rust_icon_hl()
      end,
    })
  end,
}
