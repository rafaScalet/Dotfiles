local render = require("render-markdown")
local jq = require("jq")

vim.api.nvim_create_user_command("JQ", function()
  jq.run({
    commands = {
      { command = "yq", filetype = "json" },
      { command = "yq", filetype = "yaml" },
      { command = "yq", filetype = "toml", arguments = "-oy" },
    },
  })
end, {})

render.setup({
  -- render_modes = { "n", "i", "c", "t" },
  sign = {
    enabled = false,
  },
  completions = {
    blink = { enabled = true },
    lsp = { enabled = true },
  },
  heading = {
    position = "inline",
    -- backgrounds = {}
  },
  code = {
    border = "thin",
  },
})
