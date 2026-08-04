-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-- Global border for floating windows, since 0.11. Empty means no border character
-- is created at all, so no colorscheme can draw one. blink manages its own windows
-- and ignores this, its border lives in its own opts.
vim.o.winborder = "rounded"
