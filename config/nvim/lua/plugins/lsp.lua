return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")
    local schemastore = require("schemastore")

    require("telescope").setup({})

    require("mason").setup({})

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "lua_ls",
        "jdtls",
        "taplo",
        "jsonls",
        "yamlls",
        "html",
        "cssls",
        "emmet_language_server",
      },
      automatic_enable = false,
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
    lspconfig.tailwindcss.setup({})

    -- Web
    lspconfig.cssls.setup({})
    lspconfig.html.setup({})
    lspconfig.emmet_language_server.setup({})

    -- Java (needs JDK 21)
    lspconfig.jdtls.setup({
      root_dir = vim.fn.getcwd(),
      settings = {
        java = {
          project = {
            sourcePaths = { "src", "src/main/java", "src/test/java" },
          },
        },
      },
    })

    -- Shell
    lspconfig.fish_lsp.setup({})
    lspconfig.nushell.setup({})

    -- JSON
    lspconfig.jsonls.setup({
      on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
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
          format = { enable = false },
          hover = true,
          completion = true,
        },
      },
    })

    -- TOML
    lspconfig.taplo.setup({})

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
    "nvim-telescope/telescope.nvim",
  },
}
