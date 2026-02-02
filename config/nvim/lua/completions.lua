local blink = require("blink.cmp")
local icons = require("utils.icons")

blink.setup({
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono", kind_icons = icons.lsp.kind },
  cmdline = { enabled = false },
  term = { enabled = true },
  signature = { enabled = true },
  completion = { documentation = { auto_show = true } },
  sources = {
    default = { "buffer", "env", "lsp", "path", "snippets", "omni" },
    per_filetype = {
      lua = { inherit_defaults = true, "lazydev" },
    },
    providers = {
      env = { module = "blink-cmp-env", name = "Environment Variables" },
      lazydev = { module = "lazydev.integrations.blink", score_offset = 100, name = "LazyDev" },
      lsp = { fallbacks = {}, score_offset = 99 },
      buffer = { score_offset = 97 },
      snippets = { score_offset = 98 },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
