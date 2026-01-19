vim.g.no_plugin_maps = true

local lazy = require("utils.lazy")
local loader = require("utils.loader")

lazy.add({
  { "saghen/blink.cmp", version = "1.*" }, -- Completion plugin
  "bydlw98/blink-cmp-env", -- Plugin for blink to add Env Var completions
  "rafamadriz/friendly-snippets", -- Snippets, alo integrates with blink.cmp
  "stevearc/conform.nvim", -- Plugin to define formatters
  "mfussenegger/nvim-lint", -- Plugin to define linters
  "neovim/nvim-lspconfig", -- Default configs for a bunch of LSPs
  "folke/lazydev.nvim", -- Better Config for Lua, to add lazy-loading for modules
  "mfussenegger/nvim-jdtls", -- Better Config for Java, add things like in intellij
  "mrcjkb/rustaceanvim", -- Better Config for Rust, add support for "rustup toolchain add rust-analyzer"
  "mason-org/mason.nvim", -- Plugin to install a bunch of dev-tools, like LSPs, Formatters and Linters
  "b0o/schemastore.nvim", -- A service to store schemas for markup languages, like JSON, YAML, XML, TOML and others
  "lewis6991/gitsigns.nvim", -- Add integration with git, such as blame line and file, show diffs and hunks and more
  "tpope/vim-fugitive", -- Add git commands to the vim command line
  "folke/todo-comments.nvim", -- Add custom highlight and signs for comments
  "christoomey/vim-tmux-navigator", -- Integration with tmux binds
  "echasnovski/mini.nvim", -- Mini.nvim is a pack of mini plugins, is defined in various modules
  "folke/snacks.nvim", -- Snacks.nvim is a plugin with a lot of features like pickers and ux improvements
  "nat-418/boole.nvim", -- Is a better toggle, with support for keyword and boolean values
  "johmsalas/text-case.nvim", -- Add toggles for text cases like UPPER CASE, snake_case, Pascal-Case
  "nvim-treesitter/nvim-treesitter", -- Tree-Sitter support
  { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" }, -- Tree-Sitter text objects support
  "Wansmer/treesj", -- Collapse trees using tree-sitter
  "daliusd/incr.nvim", -- Incremental selection for tree-sitter
  "bennypowers/nvim-regexplainer", -- Explain the regex under the cursor
  "folke/flash.nvim", -- A more powerfull search
  { "catppuccin/nvim", name = "catppuccin" }, -- Colorscheme, defined in "ui.colorscheme" module
  "folke/noice.nvim", -- Commandline, defined in "ui.command-line" module
  "kevinhwang91/nvim-ufo", -- Better fold options, defined in "ui.fold" module
  "nvim-lualine/lualine.nvim", -- Statusline, defined in "ui.status-line" module
  "SmiteshP/nvim-navic", -- Breadcrumbs, used in lualine.nvim
  "folke/which-key.nvim", -- Plugin to show my binds
  "jiaoshijie/undotree", -- A function and command to see the undo tree "graphically"
  "kawre/neotab.nvim", -- Plugin to "exit" close things such as ")", "'" and others
  "nmac427/guess-indent.nvim", -- User command to change the indentation
  "brenoprata10/nvim-highlight-colors", -- Add highlights for colors in formats like HEX, RGB, Tailwind and more
  "chaoren/vim-wordmotion", -- Force neovim to understand hífen and cases as spaces
  "ThePrimeagen/vim-be-good", -- Little game to practice neovim
  "tpope/vim-abolish", -- A plugin to work with words, like substitutions
})

-- Some Dependencies
lazy.add({
  "MunifTanjim/nui.nvim",
  "kevinhwang91/promise-async",
  "nvim-lua/plenary.nvim",
})

lazy.install()

loader.setup({ ignore = { "utils.*" } })
