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
  -- Formatting: biome-check in repos that have a biome config, prettier elsewhere.
  -- biome-check runs format + lint fixes + organize imports in one pass, so no
  -- LSP code_action hook is needed.
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      local biome_config = { "biome.json", "biome.jsonc", ".biome.json", ".biome.jsonc" }

      local function biome_or(fallback)
        return function(bufnr)
          local name = vim.api.nvim_buf_get_name(bufnr)
          if vim.fs.root(name, biome_config) then
            return { "biome-check" }
          end
          return fallback
        end
      end

      local fts =
        { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc", "css" }

      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(fts) do
        opts.formatters_by_ft[ft] = biome_or({ "prettier" })
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
