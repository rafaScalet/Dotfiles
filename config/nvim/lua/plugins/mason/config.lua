return {
  "mason-org/mason.nvim",
  opts = {
    ui = {
      icons = {
        package_installed = I.package.installed,
        package_pending = I.package.pending,
        package_uninstalled = I.package.uninstalled,
      },
    },
  },
}
