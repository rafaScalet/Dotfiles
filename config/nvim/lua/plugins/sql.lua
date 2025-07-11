-- stylua: ignore start
-- if true then return {} end
-- stylua: ignore end

return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup({
        sources = {
          require("dbee.sources").MemorySource:new({
            {
              name = "postgres",
              type = "postgres",
              url = "postgres://docker:postgres@localhost:5432/example?sslmode=disable",
            },
          }),
          require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
          require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
        },
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.dbs = {
        { name = "postgres", url = "postgres://docker:postgres@localhost:5432/example" },
        { name = "mysql", url = "mysql://docker:mysql@localhost:3306/example" },
      }
    end,
    keys = { { "<leader>db", ":DBUIToggle<CR>", desc = "Toggle DBUI" } },
  },
}
