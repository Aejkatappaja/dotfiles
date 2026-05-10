return {
  -- Configure rust-analyzer through rustaceanvim (from lazyvim.plugins.extras.lang.rust)
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        cmd = { "rustup", "run", "nightly", "rust-analyzer" },
        default_settings = {
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
              ignored = {
                leptos_macro = {
                  "server",
                },
              },
            },
          },
        },
      },
    },
  },
  -- Biome LSP: fixAll on save
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Keep opts intact, just add the autocmd
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client or client.name ~= "biome" then
            return
          end
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("BiomeFixAllOnSave", { clear = true }),
            callback = function()
              vim.lsp.buf.code_action({
                context = {
                  only = { "source.fixAll.biome", "source.organizeImports.biome" },
                  diagnostics = {},
                },
                apply = true,
              })
            end,
          })
        end,
      })
      return opts
    end,
  },
  -- Conform config
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      local biome_fts = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
        "css",
      }
      for _, ft in ipairs(biome_fts) do
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        local filtered = {}
        for _, f in ipairs(opts.formatters_by_ft[ft]) do
          if f ~= "biome" and f ~= "biome-organize-imports" then
            table.insert(filtered, f)
          end
        end
        opts.formatters_by_ft[ft] = filtered
      end
    end,
  },
}
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         biome = {},
--         rust_analyzer = {
--           mason = false,
--           cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
--           settings = {
--             ["rust-analyzer"] = {
--               procMacro = {
--                 ignored = {
--                   leptos_macro = {
--                     "server",
--                   },
--                 },
--               },
--             },
--           },
--         },
--       },
--     },
--   },
--
--   -- Use Biome LSP for formatting + organize imports on save (stdin is broken in biome v2)
--   {
--     "stevearc/conform.nvim",
--     optional = true,
--     opts = function(_, opts)
--       -- Remove biome from conform formatters since we use the LSP directly
--       local biome_fts = {
--         "javascript",
--         "javascriptreact",
--         "typescript",
--         "typescriptreact",
--         "json",
--         "jsonc",
--         "css",
--       }
--       for _, ft in ipairs(biome_fts) do
--         opts.formatters_by_ft = opts.formatters_by_ft or {}
--         opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
--         -- Filter out biome and biome-organize-imports from conform
--         local filtered = {}
--         for _, f in ipairs(opts.formatters_by_ft[ft]) do
--           if f ~= "biome" and f ~= "biome-organize-imports" then
--             table.insert(filtered, f)
--           end
--         end
--         opts.formatters_by_ft[ft] = filtered
--       end
--     end,
--   },
--
--   -- Biome LSP: fixAll on save (organize imports + lint fixes)
--   {
--     "neovim/nvim-lspconfig",
--     opts = function()
--       vim.api.nvim_create_autocmd("LspAttach", {
--         group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
--         callback = function(args)
--           local client = vim.lsp.get_client_by_id(args.data.client_id)
--           if not client or client.name ~= "biome" then
--             return
--           end
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             group = vim.api.nvim_create_augroup("BiomeFixAllOnSave", { clear = true }),
--             callback = function()
--               vim.lsp.buf.code_action({
--                 context = {
--                   only = { "source.fixAll.biome", "source.organizeImports.biome" },
--                   diagnostics = {},
--                 },
--                 apply = true,
--               })
--             end,
--           })
--         end,
--       })
--     end,
--   },
-- }
