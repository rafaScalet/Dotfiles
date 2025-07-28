return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-git",
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
    keymap = { preset = "cmdline" },
    appearance = { nerd_font_variant = "mono", kind_icons = I.lsp.kind },
    cmdline = { enabled = false },
    completion = {
      documentation = { auto_show = true },
      ghost_text = { enabled = true },
    },
    sources = {
      default = { "buffer", "emoji", "env", "lsp", "nerdfont", "path", "snippets" },
      providers = {
        emoji = { module = "blink-emoji" },
        commits = { module = "blink-cmp-conventional-commits" },
        env = { module = "blink-cmp-env" },
        nerdfont = { module = "blink-nerdfont" },
        git = { module = "blink-cmp-git" },
      },
      per_filetype = { gitcommit = { "commits", "git", "emoji" } },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
