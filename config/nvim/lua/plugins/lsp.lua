return {
  "mason-org/mason.nvim",
  config = function()
    require("mason").setup({})

    require("mason-tool-installer").setup({
      ensure_installed = {
        "biome", -- LSP/Formatter/Linter for JS, TS, JSX, TSX, JSON, JSONC, CSS
        "cspell", -- Linter for Any (is a spell checker)
        "cssls", -- LSP for CSS
        "emmet_language_server", -- LSP for JSX, TSX, HTML, CSS (is a integration with Emmet)
        "fish_lsp", -- LSP for Fish
        "google-java-format", -- Formatter for Java
        "html", -- LSP for HTML
        "java_language_server", -- LSP/DAP for Java
        "jsonls", -- LSP for JSON
        "lua_ls", -- LSP for Lua
        "stylua", -- Formatter for Lua
        "tailwindcss", -- LSP for JSX, TSX, HTML, CSS (is a integration with tailwind)
        "taplo", -- LSP/Formatter for TOML
        "ts_ls", -- LSP for JS, TS, JSX, TSX
        "yamlls", -- LSP/Formatter for YAML
      },
    })

    require("mason-lspconfig").setup({
      automatic_enable = {
        exclude = {
          "jsonls",
          "lua_ls",
          "yamlls",
        },
      },
    })

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          schemas = require("schemastore").yaml.schemas(),
          validate = true,
          format = { enable = true },
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
    vim.lsp.enable("yamlls")
    vim.lsp.enable("jsonls")

    vim.lsp.enable("cspell_ls") -- npm install -g @vlabo/cspell-lsp
    vim.lsp.enable("nushell") -- embed on nushell

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
    {
      "[d",
      vim.diagnostic.goto_prev,
      desc = "Go to previous diagnostic",
    },
    {
      "]d",
      vim.diagnostic.goto_next,
      desc = "Go to next diagnostic",
    },
  },
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
}
