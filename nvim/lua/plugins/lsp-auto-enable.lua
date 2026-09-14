-- Mason auto-enables every installed server that LazyVim does not explicitly
-- disable, so these four attach to buffers nobody configured them for.
-- tsgo doubles every vtsls diagnostic; the other three attach with no root.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsgo = { enabled = false },
        oxlint = { enabled = false },
        oxfmt = { enabled = false },
        cssmodules_ls = { enabled = false },
      },
    },
  },
}
