vim.api.nvim_create_user_command("BufferInfo", function(opts)
  local args = opts.args ~= "" and opts.args or "all"
  local title = "Buffer Info"

  local filetype = vim.bo.filetype
  local fileencoding = vim.bo.fileencoding
  local fileformat = vim.bo.fileformat

  ---@type utils.handlers
  local handlers = {
    all = {
      value = table.concat({
        "File Type: " .. filetype,
        "File Encoding: " .. fileencoding,
        "File Format: " .. fileformat,
      }, "\n"),
    },
    filetype = { value = filetype, title = title .. " (filetype)" },
    fileencoding = { value = fileencoding, title = title .. " (fileencoding)" },
    fileformat = { value = fileformat, title = title .. " (fileformat)" },
  }

  local infos = handlers[args] or nil
  if not infos then
    vim.notify(("Invalid argument: %s"):format(args), "error", { title = title })
    return
  end

  vim.notify(infos.value, "info", { title = infos.title or title })
end, {
  nargs = "?",
  complete = function(_, cmdline)
    if #vim.split(cmdline, "%s+") > 2 then
      return {}
    end
    return { "filetype", "fileformat", "fileencoding" }
  end,
})
