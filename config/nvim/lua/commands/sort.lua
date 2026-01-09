local keymap = require("utils.keymap")

function SortOperator(type_or_range, opts)
  local start_pos, end_pos

  if type(type_or_range) == "string" then
    if type_or_range == "char" or type_or_range == "line" then
      start_pos = vim.api.nvim_buf_get_mark(0, "[")
      end_pos = vim.api.nvim_buf_get_mark(0, "]")
    elseif type_or_range == "block" then
      start_pos = vim.api.nvim_buf_get_mark(0, "<")
      end_pos = vim.api.nvim_buf_get_mark(0, ">")
    end
  else
    local range = type_or_range
    start_pos, end_pos = { range.line1, 0 }, { range.line2, 0 }
  end

  if start_pos and end_pos then
    local flags = opts and opts.args or ""
    vim.cmd(string.format("%d,%dsort %s", start_pos[1], end_pos[1], flags))
  end
end

vim.api.nvim_create_user_command("Sort", function(opts)
  if opts.range == 0 then
    vim.o.operatorfunc = "v:lua.SortOperator"
    vim.api.nvim_feedkeys("g@", "n", false)
  else
    SortOperator({ line1 = opts.line1, line2 = opts.line2 }, opts)
  end
end, { range = true, nargs = "*" })

keymap.add({ { "<leader>co", "<cmd>Sort<cr>", "Sort" } }, { mode = { "x", "v", "n" } })
