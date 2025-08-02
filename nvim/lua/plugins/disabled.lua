return {
    -- disable bufferline
    { "akinsho/bufferline.nvim", enabled = false },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
        },
    },
    -- { "folke/snacks.nvim", enabled = false },
}
