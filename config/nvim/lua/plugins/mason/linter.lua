-- stylua: ignore start
if true then return {} end
-- stylua: ignore end

return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    require("lint").linters_by_ft = {
      markdown = { "vale" },
    }

    local linter = function()
      local lint_status, lint = pcall(require, "lint")
      if lint_status and vim.api.nvim_buf_get_option(0, "modifiable") then
        lint.try_lint()
        lint.try_lint("cspell")
      end
    end

    vim.api.nvim_create_user_command("Lint", linter, {})

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
      callback = linter,
    })
  end,
}
