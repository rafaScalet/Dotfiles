return {
  {
    "nat-418/boole.nvim",
    opts = {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
    },
    keys = {
      { "<C-a>", "<cmd>Boole increment<cr>", desc = "Increment" },
      { "<C-x>", "<cmd>Boole decrement<cr>", desc = "Decrement" },
    },
  },
  {
    "johmsalas/text-case.nvim",
    opts = { default_keymappings_enabled = false },
    keys = function()
      local cases = {
        --stylua: ignore start
        { "u", "to_upper_case",    "UPPER CASE" },
        { "l", "to_lower_case",    "lower case" },
        { "s", "to_snake_case",    "snake_case" },
        { "k", "to_kebab_case",    "kebab-case" },
        { "n", "to_constant_case", "CONSTANT_CASE" },
        { ".", "to_dot_case",      "dot.case" },
        { ",", "to_comma_case",    "comma,case" },
        { "a", "to_phrase_case",   "Phrase case" },
        { "c", "to_camel_case",    "camelCase" },
        { "p", "to_pascal_case",   "PascalCase" },
        { "r", "to_title_case",    "Title Case" },
        { "f", "to_path_case",     "path/case" },
        --stylua: ignore end
      }

      local keys = {}
      for _, case in ipairs(cases) do
        local key, fn, desc = unpack(case)
        -- operator mappings
        table.insert(keys, {
          "<leader>ca" .. key,
          function()
            require("textcase").operator(fn)
          end,
          desc = desc,
        })
        -- lsp_rename mappings
        table.insert(keys, {
          "<leader>cal" .. key,
          function()
            require("textcase").lsp_rename(fn)
          end,
          desc = desc .. " (LSP Rename)",
        })
        -- current_word mappings
        table.insert(keys, {
          "<leader>caw" .. key,
          function()
            require("textcase").current_word(fn)
          end,
          desc = desc .. " (Current Word)",
        })
      end

      return keys
    end,
  },
}
