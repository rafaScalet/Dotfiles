local schemastore = require("schemastore")
local lazydev = require("lazydev")
local keymap = require("utils.keymap")
local mason = require("utils.mason")
local picker = require("snacks.picker")

mason.add({
  "bash-language-server",
  "biome",
  "cspell-lsp",
  "css-lsp",
  "css-variables-language-server",
  "dockerfile-language-server",
  "emmet-language-server",
  "fish-lsp",
  "html-lsp",
  "jdtls",
  "json-lsp",
  "lemminx",
  "lua-language-server",
  "markdown-oxide",
  "prisma-language-server",
  "pyright",
  "tailwindcss-language-server",
  "taplo",
  "termux-language-server",
  "typescript-language-server",
  "unocss-language-server",
  "yaml-language-server",
})

lazydev.setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    "~/.config/yazi/plugins/types.yazi/",
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
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

vim.lsp.config("kdlls", {
  cmd = { "kdl-lsp" },
  filetypes = { "kdl" },
  root_markers = { ".git" },
})

vim.lsp.config("nixd", {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake (builtins.getEnv "NH_FLAKE")).nixosConfigurations.'
            .. vim.uv.os_gethostname()
            .. ".options",
        },
      },
    },
  },
})

local js_inlay_hint = {
  includeInlayParameterNameHints = "all",
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

vim.lsp.config("ts_ls", {
  settings = {
    typescript = { inlayHints = js_inlay_hint },
    javascript = { inlayHints = js_inlay_hint },
  },
})

vim.lsp.enable({
  "biome",
  "cspell_ls",
  "denols",
  "json_ls",
  "lua_ls",
  "nixd",
  "taplo",
  "ts_ls",
  "kdlls",
})

vim.lsp.inlay_hint.enable(true)

keymap.add({
  { "s", picker.lsp_symbols, "Symbols" },
  { "d", picker.lsp_definitions, "Definitions" },
  { "D", picker.lsp_declarations, "Declarations" },
  { "i", picker.lsp_implementations, "Implementations" },
  { "t", picker.lsp_type_definitions, "Types" },
  { "w", picker.lsp_workspace_symbols, "Workspace Symbols" },
}, { prefix = "<leader>lf", group = "Find" })

keymap.add({
  { "i", "<cmd>LspInfo<cr>", "Show info about active LSPs" },
  { "R", "<cmd>LspRestart<cr>", "Restart all LSPs" },
  { "s", "<cmd>LspStop", "Stop all LSPs" },
  { "h", vim.lsp.buf.hover, "Show Info Hover" },
  { "r", picker.lsp_references, "References" },
  { "c", picker.lsp_config, "Config" },
}, { prefix = "<leader>l", group = "LSP" })

keymap.add({
  { "a", vim.lsp.buf.code_action, "Code Actions" },
  { "r", vim.lsp.buf.rename, "Rename Symbol" },
  { "f", vim.lsp.buf.format, "LSP Format" },
}, { prefix = "<leader>lc", group = "Code" })

keymap.add({
  { "d", vim.lsp.buf.definition, "Go To Definition" },
  { "i", vim.lsp.buf.implementation, "Go To Implementation" },
  { "t", vim.lsp.buf.type_definition, "Go To Type Definition" },
}, { prefix = "<leader>lg", group = "Go To" })

keymap.add({
  { "a", "<cmd>LspActive all<cr>", "all" },
  { "b", "<cmd>LspActive buffer<cr>", "active buffer" },
}, { prefix = "<leader>la", group = "Active" })

keymap.add({
  {
    "p",
    function()
      local enabled = vim.lsp.inlay_hint.is_enabled()
      vim.lsp.inlay_hint.enable(not enabled)
      vim.notify((enabled and "no%s" or "  %s"):format("inlay_hint (LSP)"))
    end,
    "Toggle Inlay Hints",
  },
}, { prefix = "<localLeader>" })
