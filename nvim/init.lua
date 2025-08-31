-- Apply custom highlights on colorscheme change.
-- Must be declared before executing ':colorscheme'.
-- grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = grpid,
--   pattern = "gruvbox-material",
--   -- floating popups
--   command = "hi NormalFloat guibg=#282828 |" .. "hi FloatBorder guibg=#282828",
-- })

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
