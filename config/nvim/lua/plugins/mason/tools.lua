return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "biome", -- LSP/Formatter/Linter for JS, TS, JSX, TSX, JSON, JSONC, CSS
      "cspell", -- Linter for Any (is a spell checker)
      "cspell-lsp",
      "css-lsp", -- LSP for CSS
      "dockerls", -- LSP for Dockerfile
      "emmet_language_server", -- LSP for JSX, TSX, HTML, CSS (is a integration with Emmet)
      "fish_lsp", -- LSP for Fish
      "google-java-format", -- Formatter for Java
      "hadolint", -- Linter for Dockerfile
      "html", -- LSP for HTML
      "java_language_server", -- LSP/DAP for Java
      "jsonls", -- LSP for JSON
      "lua_ls", -- LSP for Lua
      "markdown_oxide", -- LSP for markdown
      "prismals", -- LSP for Prisma
      "stylua", -- Formatter for Lua, Luau
      "tailwindcss", -- LSP for JSX, TSX, HTML, CSS (is a integration with tailwind)
      "taplo", -- LSP/Formatter for TOML
      "ts_ls", -- LSP for JS, TS, JSX, TSX
      "vale", -- Linter for markdown
      "yamlls", -- LSP/Formatter for YAML
    },
  },
  dependencies = { "mason-org/mason.nvim", opts = {} },
}
