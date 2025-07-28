return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    -- stylua: ignore start
    { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>",     desc = "Tmux Navigate Left" },
    { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>",     desc = "Tmux Navigate Down" },
    { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>",       desc = "Tmux Navigate Up" },
    { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>",    desc = "Tmux Navigate Right" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Tmux Navigate Previous" },
    -- stylua: ignore end
  },
}
