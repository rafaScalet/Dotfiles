return {
  "saghen/blink.cmp",
  dependencies = {
    "MahanRahmati/blink-nerdfont.nvim",
    "bydlw98/blink-cmp-env",
    "disrupted/blink-cmp-conventional-commits",
    "moyiz/blink-emoji.nvim",
    "rafamadriz/friendly-snippets",
  },
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
    appearance = { nerd_font_variant = "mono", kind_icons = I.lsp.kind },
    cmdline = { enabled = false },
    completion = {
      menu = {
        winhighlight = "Normal:BlinkCmpDoc,CursorLine:BlinkCmpDocCursorLine",
        draw = { columns = { { "kind_icon", "label", gap = 1 }, { "source_name" }, { "kind" } } },
      },
      documentation = { auto_show = true },
    },
    sources = {
      default = { "buffer", "emoji", "env", "lsp", "nerdfont", "path", "snippets" },
      providers = {
        emoji = {
          name = "Emoji",
          module = "blink-emoji",
          opts = { insert = false },
        },
        conventional_commits = {
          name = "Conventional Commits",
          module = "blink-cmp-conventional-commits",
          opts = {},
        },
        env = {
          name = "EnvVar",
          module = "blink-cmp-env",
          opts = {},
        },
        nerdfont = {
          name = "NerdFont",
          module = "blink-nerdfont",
          opts = {},
        },
      },
      per_filetype = { gitcommit = { "conventional_commits" } },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
