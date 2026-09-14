-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- LazyVim's `lazyvim_wrap_spell` group turns spell on for markdown, with an
-- english dictionary over french notes: every other word gets underlined.
-- Keep its wrap, drop the spell, markdown only.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_spell_markdown", { clear = true }),
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
  end,
})
