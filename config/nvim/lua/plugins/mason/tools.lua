return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "biome", -- LSP/Formatter/Linter for JS, TS, JSX, TSX, JSON, JSONC, CSS
      "cspell", -- Linter for Any (is a spell checker)
      "cspell-lsp", -- LSP for Any (is a LSP wrapper for cspell)
      "css-lsp", -- LSP for CSS
      "dockerfile-language-server", -- LSP for Dockerfile
      "emmet-language-server", -- LSP for JSX, TSX, HTML, CSS (is a LSP wrapper for Emmet)
      "fish-lsp", -- LSP for Fish
      "google-java-format", -- Formatter for Java
      "hadolint", -- Linter for Dockerfile
      "html-lsp", -- LSP for HTML
      "java-language-server", -- LSP/DAP for Java
      "json-lsp", -- LSP for JSON
      "lua-language-server", -- LSP for Lua
      "markdown-oxide", -- LSP for markdown
      "prisma-language-server", -- LSP for Prisma
      "stylua", -- Formatter for Lua, Luau
      "tailwindcss-language-server", -- LSP for JSX, TSX, HTML, CSS (is a integration with tailwind)
      "taplo", -- LSP/Formatter for TOML
      "typescript-language-server", -- LSP for JS, TS, JSX, TSX
      "vale", -- Linter for markdown
      "yaml-language-server", -- LSP/Formatter for YAML
    },
  },
  dependencies = { "mason-org/mason.nvim", opts = {} },
}
