return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "M", desc = "Mason", action = ":Mason" },
          { icon = " ", key = "D", desc = "DataBase UI", action = ":DBUI" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    rename = { enabled = true },
    -- input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
    picker = { enabled = true },
    word = { enabled = true },
  },
  keys = {
    {
      "<leader>fc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Snacks Command Line",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Snacks Find Files",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.grep()
      end,
      desc = "Snacks Live Grep",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Snacks Git Files",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Snacks Buffers",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Snacks Help Tags",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Snacks Notifications",
    },
    {
      "<leader>gw",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Open Remote Repo",
    },
    {
      "<leader>gW",
      function()
        Snacks.gitbrowse.open()
      end,
      desc = "Open Current File in Remote",
    },
    {
      "<leader>gu",
      function()
        Snacks.gitbrowse.get_url()
      end,
      desc = "Remote Repo URL",
    },
    {
      "<leader>gl",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Show Git Log For Current Line",
    },
  },
}
