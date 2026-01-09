local treesitter = require("nvim-treesitter")
local parsers = require("nvim-treesitter.parsers")
local to = require("nvim-treesitter-textobjects")
local incr = require("incr")
local treesj = require("treesj")
local regexplainer = require("regexplainer")
local keymap = require("utils.keymap")

to.select = require("nvim-treesitter-textobjects.select")
to.swap = require("nvim-treesitter-textobjects.swap")
to.move = require("nvim-treesitter-textobjects.move")

to.setup({
  select = {
    lookahead = true,
  },
  move = {
    set_jumps = true,
  },
})

incr.setup({
  incr_key = "<backspace>",
  decr_key = "<leader><backspace>",
})

regexplainer.setup({ mappings = { toggle = "<leader>cr" } })

treesj.setup({ use_default_keymaps = false })

keymap.add({
  { "af", { "@function.outer", "textobjects" }, "Around Function" },
  { "if", { "@function.inner", "textobjects" }, "Inner Function" },
  { "ac", { "@class.outer", "textobjects" }, "Around Class" },
  { "ic", { "@class.inner", "textobjects" }, "Inner Class" },
  { "as", { "@local.scope", "local" }, "I don't know" },
}, {
  mode = { "x", "o" },
  cmd_wrapper = function(value)
    return function()
      to.select.select_textobject(value[1], value[2])
    end
  end,
})

keymap.add({
  { "n", "swap_next", "Next Parameter" },
  { "p", "swap_previous", "Previous Parameter" },
}, {
  prefix = "<leader>cs",
  group = "Swap",
  cmd_wrapper = function(value)
    return function()
      to.swap[value]("@parameter.inner")
    end
  end,
})

keymap.add({ { "<leader>cp", "<cmd>TSJToggle<cr>", "Tree Collapse" } })

treesitter.install({
  "awk",
  "bash",
  "diff",
  "gitcommit",
  "markdown",
  "markdown_inline",
  "query",
  "regex",
  "vim",
  "vimdoc",
  "lua",
  "sql",
})

-- Treesitter auto install parsers
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterAutoinsall", { clear = true }),
  callback = function(args)
    local function start(bufnr, lang)
      vim.treesitter.start(bufnr, lang)
      vim.bo[bufnr].syntax = "on"
    end

    local ft = vim.bo[args.buf].filetype
    if not ft or ft == "" then
      return
    end

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang or not parsers[lang] then
      return
    end

    if vim.treesitter.language.add(lang) then
      start(args.buf, lang)
      return
    end

    treesitter.install(lang):await(function()
      start(args.buf, lang)
    end)
  end,
})

vim.api.nvim_create_user_command("TSActiveParser", function()
  local ok, parser = pcall(vim.treesitter.get_parser)
  if not ok or not parser then
    vim.notify("Treesitter não está ativo neste buffer", vim.log.levels.WARN)
    return
  end

  local parser_list = {}

  local function collect(p)
    table.insert(parser_list, "- " .. p:lang())
    for _, child in pairs(p:children()) do
      collect(child)
    end
  end

  collect(parser)

  local uniq = {}
  for _, p in ipairs(parser_list) do
    uniq[p] = true
  end

  local result = vim.tbl_keys(uniq)
  table.sort(result)

  vim.notify(table.concat(result, "\n"), vim.log.levels.INFO, { title = "TreeSitter Active Parsers" })
end, {})
