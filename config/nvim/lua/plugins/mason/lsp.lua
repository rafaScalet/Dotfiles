return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  config = function()
    local manual_enable = {
      "jsonls",
      "yamlls",
      "nushell",
    }

    require("mason-lspconfig").setup({
      automatic_enable = {
        exclude = manual_enable,
      },
    })

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          schemas = require("schemastore").yaml.schemas(),
          validate = true,
        },
      },
    })

    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    for _, lsp in ipairs(manual_enable) do
      vim.lsp.enable(lsp)
    end
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
    { "b0o/schemastore.nvim", ft = { "json", "jsonc", "jsonl", "yaml", "yml" } },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = { library = { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
    },
    "neovim/nvim-lspconfig",
  },
}
