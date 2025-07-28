return {
  "SmiteshP/nvim-navbuddy",
  event = { "LspAttach" },
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      opts = {
        lsp = { auto_attach = true },
        icons = I.lsp.kind,
      },
    },
    { "MunifTanjim/nui.nvim" },
  },
  opts = {
    lsp = { auto_attach = true },
    icons = I.lsp.kind,
    window = { border = "rounded" },
  },
  keys = { { "<leader>nv", "<CMD>Navbuddy<CR>", desc = "NavBuddy UI" } },
}
