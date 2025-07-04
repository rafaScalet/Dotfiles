return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  config = function()
    local manual_enable = {
      "jsonls",
      "lua_ls",
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

    for _, lsp in ipairs(manual_enable) do
      vim.lsp.enable(lsp)
    end
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
    { "mason-org/mason.nvim", opts = {} },
    "b0o/schemastore.nvim",
    "neovim/nvim-lspconfig",
  },
}
