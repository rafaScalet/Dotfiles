local bind = vim.keymap.set
local dt = vim.diagnostic.toggle

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

bind("i", "jj", "<Esc>", { desc = "Exit insert mode with 'jj'" })
bind("i", "jk", "<Esc>", { desc = "Exit insert mode with 'jk'" })
bind("i", "kj", "<Esc>", { desc = "Exit insert mode with 'kj'" })
bind("i", "kk", "<Esc>", { desc = "Exit insert mode with 'kk'" })

bind({ "x", "v", "n" }, "<leader>co", "<cmd>Sort<cr>", { desc = "Sort" })
bind("n", "<leader>cx", "<cmd>MakeExec<cr>", { desc = "Make File Executable" })

bind("n", "<leader>x", "<cmd>source<cr>", { desc = "Source File (lua)" })
bind("n", "<leader>X", "<cmd>.lua<cr>", { desc = "Execute line (lua)" })

bind("n", "<leader>w", "<cmd>write<cr>", { desc = "Write File" })
bind("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit Neovim" })
bind("n", "<leader>u", "<cmd>update<cr>", { desc = "Update File (Save if needed)" })
bind("n", "<leader>e", "<cmd>edit<cr>", { desc = "Edit File (For vim.bo.filetype)" })

bind("n", "<leader>\\", "<cmd>vnew<cr>", { desc = "Split Vertically" })
bind("n", "<leader>-", "<cmd>new<cr>", { desc = "Split Horizontally" })

bind({ "n", "x", "i" }, "<C-up>", "<c-w>+", { desc = "Resize Split Up" })
bind({ "n", "x", "i" }, "<C-down>", "<c-w>-", { desc = "Resize Split Down" })
bind({ "n", "x", "i" }, "<C-left>", "<c-w>5>", { desc = "Resize Split to Left" })
bind({ "n", "x", "i" }, "<C-right>", "<c-w>5<", { desc = "Resize Split to Right" })

bind("n", "<localLeader>Ds", dt.signs, { desc = "Toggle Signs" })
bind("n", "<localLeader>DS", dt.severity_sort, { desc = "Toggle Severity Sort" })
bind("n", "<localLeader>Du", dt.underline, { desc = "Toggle Underline" })
bind("n", "<localLeader>DU", dt.update_in_insert, { desc = "Toggle Update In Insert" })
bind("n", "<localLeader>Dv", dt.virtual_text, { desc = "Toggle Virtual Text" })
bind("n", "<localLeader>DV", dt.virtual_lines, { desc = "Toggle Virtual Lines" })

bind("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Buffer Delete" })
bind("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Buffer Force Delete" })
bind("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Buffer Next" })
bind("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Buffer Previous" })
bind("n", "<leader>bf", "<cmd>bfirst<cr>", { desc = "Buffer First" })
bind("n", "<leader>bl", "<cmd>blast<cr>", { desc = "Buffer Last" })
bind("n", "<leader>bm", "<cmd>bmodified<cr>", { desc = "Buffer Modified" })
bind("n", "<leader>br", "<cmd>e#<cr>", { desc = "Buffer Recent" })

bind({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy To The Clipboard" })
bind("n", "<leader>Y", '"+Y', { desc = "Copy Line To The Clipboard" })
bind("n", "<leader>p", '"+p', { desc = "Paste from the Clipboard" })

bind({ "n", "v", "o" }, "B", "^", { desc = "Move to beginning of line" })
bind({ "n", "v", "o" }, "E", "$", { desc = "Move to end of line" })

bind("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Open a New Terminal Buffer" })

bind("t", "<esc>", "<c-\\><c-n>", { desc = "Easily Quit in a Terminal Buffer" })

bind("t", "jj", "<c-\\><c-n>", { desc = "Exit terminal mode with 'jj'" })
bind("t", "jk", "<c-\\><c-n>", { desc = "Exit terminal mode with 'jk'" })
bind("t", "kj", "<c-\\><c-n>", { desc = "Exit terminal mode with 'kj'" })
bind("t", "kk", "<c-\\><c-n>", { desc = "Exit terminal mode with 'kk'" })
