return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  cmd = "Mason",
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")
    local schemastore = require("schemastore")

    require("mason").setup({})

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "lua_ls",
        "pyright",
        "jdtls",
        "taplo",
        "jsonls",
        "yamlls",
      },
    })

    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
    })

    -- Javascript and Typescript
    lspconfig.ts_ls.setup({})
    lspconfig.biome.setup({})
    lspconfig.eslint.setup({})
    lspconfig.angularls.setup({})

    -- Python
    lspconfig.pyright.setup({})

    -- Java
    lspconfig.jdtls.setup({})

    -- JSON
    lspconfig.jsonls.setup({
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- YAML
    lspconfig.yamlls.setup({
      settings = {
        yaml = {
          schemas = schemastore.yaml.schemas(),
          validate = true,
          format = { enable = true },
          hover = true,
          completion = true,
        },
      },
    })

    -- TOML
    lspconfig.taplo.setup({})

    lspconfig.harper_ls.setup({})

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
        format = function(diagnostic)
          local icons = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          }
          return icons[diagnostic.severity] .. diagnostic.message
        end,
      },
      signs = false,
    })
  end,
  keys = {
    { "K", vim.lsp.buf.hover, desc = "Show info about the hovered keyword" },
    { "gd", vim.lsp.buf.definition, desc = "Jump to definition" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Display code actions" },
    { "[d", vim.diagnostic.goto_prev, {} },
    { "]d", vim.diagnostic.goto_next, {} },
  },
  dependencies = {
    "b0o/schemastore.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
}
