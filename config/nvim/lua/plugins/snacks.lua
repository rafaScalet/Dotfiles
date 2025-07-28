return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        keys = {
          -- stylua: ignore start
          { icon = I.search,      key = "f", desc = "Find File",    action = ":lua Snacks.dashboard.pick('files')" },
          { icon = I.fs.file.add, key = "n", desc = "New File",     action = ":ene | startinsert" },
          { icon = I.text,        key = "g", desc = "Find Text",    action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = I.fs.file.two, key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = I.package.i,   key = "L", desc = "Lazy",         action = ":Lazy",                                  enabled = package.loaded.lazy ~= nil },
          { icon = I.tool,        key = "M", desc = "Mason",        action = ":Mason" },
          { icon = I.flame,       key = "G", desc = "Vim Be Good",  action = ":VimBeGood" },
          { icon = I.exit,        key = "q", desc = "Quit",         action = ":qa" },
          -- stylya: ignore end
        },
      },
      sections = {
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
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
    { "<leader>fc", function() Snacks.picker.commands() end,        desc = "Command Line" },
    { "<leader>fC", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>ff", function() Snacks.picker.files() end,           desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end,          desc = "Find Recent Files" },
    { "<leader>fl", function() Snacks.picker.grep() end,            desc = "Live Grep" },
    { "<leader>fg", function() Snacks.picker.git_files() end,       desc = "Git Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end,         desc = "Buffers" },
    { "<leader>fh", function() Snacks.picker.help() end,            desc = "Help Tags" },
    { "<leader>fn", function() Snacks.picker.notifications() end,   desc = "Notifications" },
    { "<leader>gw", function() Snacks.gitbrowse.open() end,         desc = "Open Remote File In Repo" },
    -- stylua: ignore end
  },
}
