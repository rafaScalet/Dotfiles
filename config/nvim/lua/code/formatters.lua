local conform = require("conform")
local keymap = require("utils.keymap")
local mason = require("utils.mason")

mason.add({
  "biome",
  "black",
  "google-java-format",
  "isort",
  "kdlfmt",
  "nginx-config-formatter",
  "nixfmt",
  "stylua",
  "taplo",
  "xmlformatter",
})

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
    typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
    json = { "prettierd", "prettier", "biome", stop_after_first = true },
    jsonc = { "prettierd", "prettier", "biome", stop_after_first = true },
    html = { "prettierd", "prettier", "biome", stop_after_first = true },
    css = { "prettierd", "prettier", "biome", stop_after_first = true },
    python = { "isort", "black" },
    java = { "google-java-format" },
    fish = { "fish_indent" },
    rust = { "rustfmt" },
    xml = { "xmlformat" },
    dockerfile = { "dockerfmt" },
    nginx = { "nginxfmt" },
    nix = { "nixpkgs_fmt", "nixfmt" },
    toml = { "taplo" },
    kdl = { "kdlfmt" },
    markdown = { "injected" },
    nu = { "nufmt" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  conform.format({ async = true, range = range })
end, { range = true })

keymap.add({ { "<leader>cf", "<cmd>Format<cr>", "Format" } })
