local lint = require("lint")
local keymap = require("utils.keymap")
local mason = require("utils.mason")

mason.add({
  "checkstyle",
  "hadolint",
})

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

keymap.add({ { "<leader>cl", "<cmd>Lint<cr>", "Linter" } })
