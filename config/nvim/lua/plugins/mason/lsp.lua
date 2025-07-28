return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  config = function()
    require("mason-lspconfig").setup({
      automatic_enable = {
        exclude = { "jsonls" },
      },
    })

    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          format = { enable = true },
          validate = { enable = true },
        },
      },
    })

    vim.lsp.enable({ "nushell", "jsonls", "rust-analyzer" })
  end,
  keys = {
    { "K", vim.lsp.buf.hover, desc = "Show info about the hovered keyword" },
    { "gd", vim.lsp.buf.definition, desc = "Jump to definition" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Display code actions" },
    { "[d", vim.diagnostic.get_prev(), desc = "Go to previous diagnostic" },
    { "]d", vim.diagnostic.get_next(), desc = "Go to next diagnostic" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    { "b0o/schemastore.nvim" },
    { "neovim/nvim-lspconfig" },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = { library = { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
    },
  },
}
