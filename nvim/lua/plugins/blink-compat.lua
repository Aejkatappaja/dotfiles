return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "saghen/blink.compat", version = "2.*" },
    },
    opts = {
      -- blink ships border = nil, so no edge is drawn and a theme has nothing to paint
      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "rounded" } },
    },
  },
}
