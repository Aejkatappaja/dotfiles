return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          mason = false,
          cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
          settings = {
              ["rust-analyzer"] = {
                -- Other Settings ...
                procMacro = {
                  ignored = {
                      leptos_macro = {
                          -- optional: --
                          -- "component",
                          "server",
                      },
                  },
                },
              },
            }
        },
      },
    },
  },
}
