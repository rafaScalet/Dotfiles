return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = false },
    gitbrowse = { enabled = true },
    rename = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
    picker = { enabled = true },
    word = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    { "<leader>fC", function() Snacks.picker.command_history() end,    desc = "Command History" },
    { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Diagnostics in Buffer" },
    { "<leader>fb", function() Snacks.picker.buffers() end,            desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.commands() end,           desc = "Command Line" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end,        desc = "Diagnostics" },
    { "<leader>ff", function() Snacks.picker.files() end,              desc = "Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end,          desc = "Git Files" },
    { "<leader>fh", function() Snacks.picker.help() end,               desc = "Help Tags" },
    { "<leader>fk", function() Snacks.picker.keymaps() end,            desc = "Keymaps" },
    { "<leader>fk", function() Snacks.picker.undo() end,               desc = "Undo History" },
    { "<leader>fl", function() Snacks.picker.grep() end,               desc = "Live Grep" },
    { "<leader>fn", function() Snacks.picker.notifications() end,      desc = "Notifications" },
    { "<leader>fr", function() Snacks.picker.recent() end,             desc = "Recent Files" },
    { "<leader>gw", function() Snacks.gitbrowse.open() end,            desc = "Open Remote File In Repo" },
    -- stylua: ignore end
  },
}
