local blink = require("blink.cmp")
local icons = require("utils.icons")

blink.setup({
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono", kind_icons = icons.lsp.kind },
  cmdline = { enabled = false },
  completion = { documentation = { auto_show = true } },
  sources = {
    default = { "buffer", "env", "lazydev", "lsp", "path", "snippets" },
    providers = {
      env = { module = "blink-cmp-env" },
      lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
