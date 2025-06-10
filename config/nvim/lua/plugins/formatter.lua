return {
  "stevearc/conform.nvim",
  lazy = false,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "cspell", "stylua" },
        javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
        typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
        json = { "prettierd", "prettier", "biome", stop_after_first = true },
        python = { "isort", "black" },
        java = { "google-java-format" },
        fish = { "fish_indent" },
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
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  end,
  keys = { { "<leader>F", ":Format<CR>", desc = "Format current file" } },
}
