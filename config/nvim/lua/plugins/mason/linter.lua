return {
  "mfussenegger/nvim-lint",
  cmd = "Lint",
  event = { "BufWritePost" },
  keys = { { "<leader>cl", "<cmd>Lint<cr>", desc = "Linter" } },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      rust = { "clippy" },
      java = { "checkstyle" },
      dockerfile = { "hadolint" },
      fish = { "fish" },
    }

    local linter = function()
      lint.try_lint()
    end

    vim.api.nvim_create_user_command("Lint", linter, {})

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = linter,
    })
  end,
}
