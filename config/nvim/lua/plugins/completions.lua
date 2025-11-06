return {
  "saghen/blink.cmp",
  dependencies = {
    "bydlw98/blink-cmp-env",
    "rafamadriz/friendly-snippets",
  },
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono", kind_icons = I.lsp.kind },
    cmdline = { enabled = false },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { "buffer", "env", "lsp", "path", "snippets" },
      providers = { env = { module = "blink-cmp-env" } },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
