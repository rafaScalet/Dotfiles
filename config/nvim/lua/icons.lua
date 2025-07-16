local icons = {
  error = "",
  warn = "",
  info = "",
  hint = "",
  git_branch = "",
  git_status_added = "",
  git_status_removed = "",
  git_status_modified = "",
}

local icons_with_space = {}

for key, icon in pairs(icons) do
  icons_with_space[key] = icon .. " "
end

return {
  plain = icons,
  spaced = icons_with_space,
}
