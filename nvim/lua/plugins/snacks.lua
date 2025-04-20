return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            hidden = true,
            ignored = true,
            -- exclude = {
            -- "**/.git/*",
            --},
            sources = {
                files = {
                    hidden = true,
                    ignored = true,
                    -- exclude = {
                    -- "**/.git/*",
                    --},
                },
                explorer = {
                    layout = {
                        preset = "sidebar",
                        preview = false,
                        layout = { position = "right" },

                    },
                },
            },
        },
    },
}
