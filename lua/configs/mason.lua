-- configs/mason-lsp.lua
local mason = require "mason"

-- Mason setup (for managing LSP servers)
mason.setup {
  ui = {
    border = "rounded",
    height = 0.7,
    width = 0.7,
    icons = {
      package_installed = "",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}


