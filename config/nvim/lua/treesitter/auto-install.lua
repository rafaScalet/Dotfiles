local treesitter = require("nvim-treesitter")
local parsers = require("nvim-treesitter.parsers")

treesitter.install({
  "awk",
  "bash",
  "diff",
  "git_rebase",
  "gitcommit",
  "markdown",
  "markdown_inline",
  "query",
  "regex",
  "sql",
  "vim",
  "vimdoc",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterAutoInstall", { clear = true }),
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
