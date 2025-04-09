vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Função para aplicar o background de Normal na statusline
local function unify_statusline_background()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  local bg = normal_hl.bg

  if bg ~= nil then
    vim.api.nvim_set_hl(0, "StatusLine", { bg = bg, fg = normal_hl.fg or "#ffffff" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = bg, fg = normal_hl.fg or "#aaaaaa" })
  end
end

-- Hook pós-colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = unify_statusline_background,
})

-- Executa imediatamente após carregar o colorscheme
unify_statusline_background()

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.breakindent = true

vim.opt.scrolloff = 5

vim.opt.cursorline = true

vim.opt.undofile = true

vim.opt.mouse = "a"

vim.opt.cmdheight = 0

vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = false
vim.opt.listchars = {
  space = "·",
  tab = "» ",
  trail = "•",
  extends = "⟩",
  precedes = "⟨",
  eol = "↲",
  nbsp = "␣",
}

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight yank",
})
