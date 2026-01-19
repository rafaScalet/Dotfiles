local keymap = require("utils.keymap")
local undotree = require("undotree")
local picker = require("snacks.picker")

keymap.add({
  { "jj", "<Esc>", "Exit insert mode with 'jj'" },
  { "jk", "<Esc>", "Exit insert mode with 'jk'" },
  { "kj", "<Esc>", "Exit insert mode with 'kj'" },
  { "kk", "<Esc>", "Exit insert mode with 'kk'" },
}, { mode = "i" })

keymap.add({
  { "x", "<cmd>source<cr>", "Source File (lua)" },
  { "X", "<cmd>.lua<cr>", "Execute Line (lua)" },
  { "w", "<cmd>write<cr>", "Write File" },
  { "q", "<cmd>quit<cr>", "Quit Neovim" },
  { "u", "<cmd>update<cr>", "Update File (Save If Needed)" },
  { "e", "<cmd>edit<cr>", "Edit File (re-open)" },
  { "E", picker.explorer, "Explorer" },
  { "\\", "<cmd>vnew<cr>", "Split Verticaly" },
  { "-", "<cmd>new<cr>", "Split Horizontaly" },
  { "t", "<cmd>terminal<cr>", "Open a New Terminal Buffer" },
  { "y", '"+y', "Copy To The Clipboard" },
  { "Y", '"+Y', "Copy Line To The Clipboard" },
  { "P", '"+p', "Paste from the Clipboard" },
}, { prefix = "<leader>", mode = { "n", "x" } })

keymap.add({
  { "<C-up>", "<c-w>+", "Resize Split Up" },
  { "<C-down>", "<c-w>-", "Resize Split Down" },
  { "<C-left>", "<c-w>5>", "Resize Split to Left" },
  { "<C-right>", "<c-w>5<", "Resize Split to Right" },
}, { mode = { "n", "x", "i" } })

keymap.add({
  { "d", "<cmd>bdelete<cr>", "Delete" },
  { "D", "<cmd>bdelete!<cr>", "Force Delete" },
  { "N", "<cmd>bnext<cr>", "Next" },
  { "P", "<cmd>bprev<cr>", "Previous" },
  { "f", "<cmd>bfirst<cr>", "First" },
  { "l", "<cmd>blast<cr>", "Last" },
  { "m", "<cmd>bmodified<cr>", "Modified" },
  { "r", "<cmd>e#<cr>", "Recent" },
  { "n", "<cmd>enew<cr>", "New" },
  { "i", "<cmd>BufferInfo filetype<cr>", "Type" },
  { "o", "<cmd>BufferInfo fileformat<cr>", "Format" },
  { "e", "<cmd>BufferInfo fileencoding<cr>", "Encoding" },
}, { prefix = "<leader>b", group = "Buffer" })

keymap.add({
  { "B", "^", "Move to beginning of line" },
  { "E", "$", "Move to end of line" },
}, { mode = { "n", "v", "o" } })

keymap.add({
  { "b", picker.buffers, "Buffers" },
  { "f", picker.files, "Files" },
  { "h", picker.help, "Help" },
  { "k", picker.keymaps, "Keymaps" },
  { "u", picker.undo, "Undo" },
  { "m", picker.marks, "Marks" },
  { "n", picker.notifications, "Notifications" },
  { "p", picker.pick, "Pickers" },
  { "r", picker.recent, "Recent Files" },
  { "P", picker.lazy, "Plugins" },
}, { prefix = "<leader>f", group = "Find" })

keymap.add({
  { "g", picker.grep, "Live Grep" },
  { "w", picker.grep_word, "Current Word" },
  { "b", picker.grep_buffers, "Opened Buffers" },
  { "f", picker.lines, "Current File" },
}, { prefix = "<leader>fs", group = "Grep" })

keymap.add({
  { "h", picker.command_history, "History" },
  { "l", picker.commands, "Line" },
}, { prefix = "<leader>fc", group = "Command" })

keymap.add({ { "<leader>cu", undotree.toggle, "Undotree" } })

keymap.wk({ "<leader>c", group = "Code" })
