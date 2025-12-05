return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    -- stylua: ignore start
    ensure_installed = {
      -- "arduino-language-server",    -- LSP for arduino
      "bash-language-server",          -- LSP for Bash
      "biome",                         -- LSP/Formatter/Linter for JS, TS, JSX, TSX, JSON, JSONC, CSS
      "black",                         -- Formatter for python
      "checkstyle",                    -- Linter for java
      -- "clangd",                     -- LSP for C, C++
      "cspell-lsp",                    -- LSP for Any (is a LSP wrapper for cspell)
      "css-lsp",                       -- LSP for CSS
      "css-variables-language-server", -- LSP for CSS (support for variables)
      "dockerfile-language-server",    -- LSP for Dockerfile
      "emmet-language-server",         -- LSP for JSX, TSX, HTML, CSS (is a LSP wrapper for Emmet)
      "fish-lsp",                      -- LSP for Fish
      "google-java-format",            -- Formatter for Java
      "hadolint",                      -- Linter for Dockerfile
      "html-lsp",                      -- LSP for HTML
      "isort",                         -- Formatter for python (sort the imports)
      "jdtls",                         -- LSP for java
      "json-lsp",                      -- LSP/Formatter for JSON
      "lemminx",                       -- LSP for XML
      "lua-language-server",           -- LSP for Lua
      "markdown-oxide",                -- LSP for markdown
      "nil",                           -- LSP for Nix and Nixos
      "nixfmt",                        -- Formatter for Nix
      "prisma-language-server",        -- LSP for Prisma
      "pyright",                       -- LSP/Linter for python
      "rust-analyzer",                 -- LSP for Rust
      "stylua",                        -- Formatter for Lua, Luau
      "tailwindcss-language-server",   -- LSP for JSX, TSX, HTML, CSS (is a integration with tailwind)
      "taplo",                         -- LSP/Formatter for TOML
      "termux-language-server",        -- LSP for some specific bash scripts like PKGBUILD
      "typescript-language-server",    -- LSP for JS, TS, JSX, TSX
      "unocss-language-server",        -- LSP for JSX, TSX, HTML, CSS and more (is a integration with UnoCSS)
      "vale",                          -- Linter for markdown
      "xmlformatter",                  -- Formatter for XML
      "yaml-language-server",          -- LSP/Formatter for YAML
    },
    -- stylua: ignore end
  },
  dependencies = { "mason-org/mason.nvim", opts = {} },
}
