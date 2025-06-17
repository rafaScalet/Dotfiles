return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "biome",
        "black",
        "cssls",
        "emmet_language_server",
        "fish_lsp",
        "google-java-format",
        "html",
        "isort",
        "jdtls",
        "jsonls",
        "lua_ls",
        "stylua",
        "tailwindcss",
        "taplo",
        "ts_ls",
        "yamlls",
      },
    })

    require("mason-lspconfig").setup({
      automatic_enable = {
        exclude = {
          "jdtls",
          "jsonls",
          "lua_ls",
          "yamlls",
        },
      },
    })

    vim.lsp.config("jdtls", {
      root_dir = vim.fn.getcwd(),
      settings = {
        java = {
          project = {
            sourcePaths = { "src", "src/main/java", "src/test/java" },
          },
        },
      },
    })

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          schemas = require("schemastore").yaml.schemas(),
          validate = true,
          format = { enable = false },
          hover = true,
          completion = true,
        },
      },
    })

    vim.lsp.config("jsonls", {
      on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config("lua_ls", {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath("config")
            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
            path = {
              "lua/?.lua",
              "lua/?/init.lua",
            },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("jdtls")
    vim.lsp.enable("yamlls")
    vim.lsp.enable("jsonls")

    vim.lsp.enable("cspell_ls") --- npm install -g @vlabo/cspell-lsp
    vim.lsp.enable("nushell") --- embed on nushell

    vim.diagnostic.config({
      virtual_text = {
        prefix = " ",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " ",
        },
      },
    })
  end,
  keys = {
    { "K", vim.lsp.buf.hover, desc = "Show info about the hovered keyword" },
    { "gd", vim.lsp.buf.definition, desc = "Jump to definition" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Display code actions" },
    { "[d", vim.diagnostic.goto_prev, {}, desc = "Go to previous diagnostic" },
    { "]d", vim.diagnostic.goto_next, {}, desc = "Go to next diagnostic" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {}, build = ":MasonUpdate" },
    "b0o/schemastore.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
}
