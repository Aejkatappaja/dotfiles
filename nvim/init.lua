vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    require("gitsigns").toggle_current_line_blame(true)
  end,
})
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
