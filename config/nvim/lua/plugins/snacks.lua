return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    rename = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
    picker = { enabled = true },
    word = { enabled = true },
  },
  keys = function()
    local snacks = require("snacks")

    local sev = vim.diagnostic.severity

    local function diag_filter(severity)
      return function(item)
        return item.severity == severity
      end
    end

    local pickers = {
      -- stylua: ignore start
      { "<leader>fb",   "buffers",               "Buffers" },
      { "<leader>ff",   "files",                 "Files" },
      { "<leader>fh",   "help",                  "Help Tags" },
      { "<leader>fk",   "keymaps",               "Keymaps" },
      { "<leader>fu",   "undo",                  "Undo History" },
      { "<leader>fm",   "marks",                 "Marks" },
      { "<leader>fn",   "notifications",         "Notifications" },
      { "<leader>fp",   "pick",                  "Picker" },
      { "<leader>fr",   "recent",                "Recent Files" },
      { "<leader>fP",   "lazy",                  "Plugins Spec" },

      { "<leader>fsg",  "grep",                  "Live Grep" },
      { "<leader>fsw",  "grep_word",             "Current Word" },
      { "<leader>fsb",  "grep_buffers",          "Opened Buffers" },
      { "<leader>fsf",  "lines",                 "Current File" },

      { "<leader>fch",  "command_history",       "History" },
      { "<leader>fcl",  "commands",              "Line" },

      { "<leader>fdaa", "diagnostics",           "All" },
      { "<leader>fdai", "diagnostics",           "Info",             { filter = { filter = diag_filter(sev.I) } } },
      { "<leader>fdah", "diagnostics",           "Hint",             { filter = { filter = diag_filter(sev.N) } } },
      { "<leader>fdaw", "diagnostics",           "Warn",             { filter = { filter = diag_filter(sev.W) } } },
      { "<leader>fdae", "diagnostics",           "Erro",             { filter = { filter = diag_filter(sev.E) } } },
      { "<leader>fdba", "diagnostics_buffer",    "All" },
      { "<leader>fdbi", "diagnostics_buffer",    "Info",             { filter = { filter = diag_filter(sev.I) } } },
      { "<leader>fdbh", "diagnostics_buffer",    "Hint",             { filter = { filter = diag_filter(sev.N) } } },
      { "<leader>fdbw", "diagnostics_buffer",    "Warn",             { filter = { filter = diag_filter(sev.W) } } },
      { "<leader>fdbe", "diagnostics_buffer",    "Erro",             { filter = { filter = diag_filter(sev.E) } } },

      { "<leader>fgL",  "git_log_file",          "Log File" },
      { "<leader>fgS",  "git_stash",             "Stash" },
      { "<leader>fgb",  "git_branches",          "Branches" },
      { "<leader>fgd",  "git_diff",              "Hunks" },
      { "<leader>fgf",  "git_files",             "Files" },
      { "<leader>fgl",  "git_log",               "Log" },
      { "<leader>fgs",  "git_status",            "Status" },
      { "<leader>fgg",  "git_grep",              "Grep" },

      { "<leader>flc",  "lsp_config",            "Config" },
      { "<leader>fls",  "lsp_symbols",           "Symbols" },
      { "<leader>flr",  "lsp_references",        "References" },
      { "<leader>fld",  "lsp_definitions",       "Definitions" },
      { "<leader>flD",  "lsp_declarations",      "Declarations" },
      { "<leader>fli",  "lsp_implementations",   "Implementations" },
      { "<leader>flt",  "lsp_type_definitions",  "Types" },
      { "<leader>flw",  "lsp_workspace_symbols", "Workspace Symbols" },
      -- stylua: ignore end
    }

    local keys = {}
    for _, picker in ipairs(pickers) do
      local key, fn, desc, opts = unpack(picker)
      table.insert(keys, {
        key,
        function()
          snacks.picker[fn](opts)
        end,
        desc = desc,
      })
    end

    return keys
  end,
}
