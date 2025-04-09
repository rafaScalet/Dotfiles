return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jonarrien/telescope-cmdline.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>fc", ":Telescope cmdline<CR>",    desc = "Telescope Command Line" },
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Telescope find files" },
    { "<leader>fl", ":Telescope live_grep<CR>",  desc = "Telescope live grep" },
    { "<leader>fg", ":Telescope git_files<CR>",  desc = "Telescope live grep" },
    { "<leader>fb", ":Telescope buffers<CR>",    desc = "Telescope buffers" },
    { "<leader>fh", ":Telescope help_tags<CR>",  desc = "Telescope help tags" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })
    require("telescope").load_extension("cmdline")
    require("telescope").load_extension("ui-select")
  end,
}
