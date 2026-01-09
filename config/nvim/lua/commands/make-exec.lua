local keymap = require("utils.keymap")

vim.api.nvim_create_user_command("MakeExec", function()
  local file = vim.api.nvim_buf_get_name(0)
  local file_name = vim.fn.shellescape(file)
  if file == "" then
    print("No file to make executable")
    return
  end
  os.execute("chmod +x " .. file_name)
  print("Made " .. file_name .. " executable")
end, {})

keymap.add({ { "<leader>cx", "<cmd>MakeExec<cr>", "Make File Executable" } })
