-- LazyVim's lang.markdown extra ships `heading = { icons = {} }` and
-- `checkbox = { enabled = false }`, which is why headings keep their raw `#`
-- and checkboxes stay plain. Put the plugin's own defaults back.
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      checkbox = { enabled = true },
      latex = { enabled = false }, -- no latex parser installed, silences the health warning
    },
  },
}
