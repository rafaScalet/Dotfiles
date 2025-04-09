return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    case_insensitive = true,
    show_hidden = true,
  },
  config = function()
    require("oil").setup({
      case_insensitive = true,
      show_hidden = true,
    })

    vim.keymap.set("n", "-", ":Oil --float<CR>", { silent = true, desc = "Open up Oil.nvim" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.keymap.set({ "n", "i" }, "<Esc>", "<ESC>:wq<CR>", { buffer = true, silent = true })
        vim.keymap.set("i", "<CR>", "<ESC>", { buffer = true, silent = true })
      end,
    })
  end,
  dependencies = { "echasnovski/mini.icons", opts = {} },
  lazy = false,
}
