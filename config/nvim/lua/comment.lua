local comment = require("mini.comment")
local todo = require("todo-comments")
local keymap = require("utils.keymap")

comment.setup({
  mappings = {
    -- stylua: ignore start
    comment        = "<leader>cc",
    comment_line   = "<leader>ccc",
    comment_visual = "<leader>cc",
    textobject     = "<leader>cc",
    -- stylua: ignore end
  },
})

todo.setup({})

keymap.add({
  { "n", todo.jump_next, "Next" },
  { "p", todo.jump_prev, "Prev" },
}, { prefix = "<leader>cct", group = "To Do" })

vim.api.nvim_create_user_command("TodoEnable", todo.enable, {})

vim.api.nvim_create_user_command("TodoDisable", todo.disable, {})
