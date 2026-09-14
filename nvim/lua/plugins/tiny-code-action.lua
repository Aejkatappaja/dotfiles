return {
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = { "folke/snacks.nvim" },
    event = "LspAttach",
    opts = {
      backend = "delta",
      picker = "snacks",
      backend_opts = {
        delta = {
          header_lines_to_remove = 4,
          args = { "--line-numbers" },
        },
      },
    },
  },
  -- Replace LazyVim's <leader>ca with the tiny-code-action picker.
  -- `opts_extend` on `servers.*.keys` appends, and the last entry for a given
  -- lhs wins, so this overrides the default without touching the rest.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "<leader>ca",
              function()
                require("tiny-code-action").code_action()
              end,
              desc = "Code Action",
              mode = { "n", "x" },
              has = "codeAction",
            },
          },
        },
      },
    },
  },
}
