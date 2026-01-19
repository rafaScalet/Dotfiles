local keymap = require("utils.keymap")

vim.api.nvim_create_user_command("TSActiveParser", function()
  local title = "TreeSitter Active Parsers"
  local ok, parser = pcall(vim.treesitter.get_parser)
  if not ok or not parser then
    vim.notify("TreeSitter isn't activated in this buffer", "warn", { title = title })
    return
  end

  local parser_list = {}

  local function collect(p)
    table.insert(parser_list, "- " .. p:lang())
    for _, child in pairs(p:children()) do
      collect(child)
    end
  end

  collect(parser)

  local uniq = {}
  for _, p in ipairs(parser_list) do
    uniq[p] = true
  end

  local result = vim.tbl_keys(uniq)
  table.sort(result)

  vim.notify(table.concat(result, "\n"), "info", { title = title })
end, {})

keymap.add({ { "<leader>ck", "<cmd>TSActiveParser<cr>", "Active Parsers" } })
