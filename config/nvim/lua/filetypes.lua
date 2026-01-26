vim.filetype.add({
  filename = {
    ["swag.conf"] = "nginx",
  },
  pattern = {
    ["%.env%..*"] = "sh",
    ["Dockerfile.*"] = "dockerfile",
  },
})
