return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          format = { enable = true },
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config("denols", {
      root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
        if root then
          on_dir(root)
        end
      end,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          hint = { enable = true },
        },
      },
    })

    vim.lsp.enable({ "nushell", "denols", "dartls" })

    vim.lsp.inlay_hint.enable(true)
  end,
  keys = {
    -- stylua: ignore start
    { "<leader>li",  "<cmd>LspInfo<cr>",          desc = "Show info about active LSPs" },
    { "<leader>lR",  "<cmd>LspRestart<cr>",       desc = "Restart all LSPs" },
    { "<leader>ls",  "<cmd>LspStop",              desc = "Stop all LSPs" },
    { "<leader>lh",  vim.lsp.buf.hover,           desc = "Show Info Hover" },
    { "<leader>lr",  vim.lsp.buf.references,      desc = "List References" },

    { "<leader>lca", vim.lsp.buf.code_action,     desc = "Code Actions" },
    { "<leader>lcr", vim.lsp.buf.rename,          desc = "Rename Symbol" },
    { "<leader>lcf", vim.lsp.buf.format,          desc = "LSP Format" },

    { "<leader>lgd", vim.lsp.buf.definition,      desc = "Go To Definition" },
    { "<leader>lgi", vim.lsp.buf.implementation,  desc = "Go To Implementation" },
    { "<leader>lgt", vim.lsp.buf.type_definition, desc = "Go To Type Definition" },

    { "<leader>ldn", vim.diagnostic.goto_next,    desc = "Go To Next Diagnostic" },
    { "<leader>ldp", vim.diagnostic.goto_prev,    desc = "Go To Previous Diagnostic" },
    { "<leader>lds", vim.diagnostic.open_float,   desc = "Show Diagnostic" },
    { "<leader>ldl", vim.diagnostic.setloclist,   desc = "Show Diagnostics In Location List" },
    { "<leader>ldq", vim.diagnostic.setqflist,    desc = "Show Diagnostics In Quickfix List" },

    {
      "<localLeader>Lh",
      function()
        local enabled = vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(not enabled)
        vim.notify((enabled and "no%s" or "  %s"):format("inlay_hint (LSP)"))
      end,
      desc = "Toggle Inlay Hints"
    },
    -- stylua: ignore end
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    { "mason-org/mason-lspconfig.nvim", opts = {} },
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    { "b0o/schemastore.nvim" },
    { "mfussenegger/nvim-jdtls" },
    { "mrcjkb/rustaceanvim", version = "^6", lazy = false },
  },
}
