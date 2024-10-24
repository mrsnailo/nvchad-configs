vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
local M = {}

M.statuscol = function()
  local builtin = require "statuscol.builtin"
  require("statuscol").setup {
    relculright = true,
    bt_ignore = {
      "nofile",
      "prompt",
      "terminal",
      "lazy"
    },
    ft_ignore = {
      "NvimTree",
      "dashboard",
      "nvcheatsheet",
      "dapui_watches",
      "dap-repl",
      "dapui_console",
      "dapui_stacks",
      "dapui_breakpoints",
      "dapui_scopes",
      "help",
      "vim",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "noice",
      "lazy",
      "toggleterm",
    },
    segments = {
      -- { text = { " " } },
      { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      -- { text = { " " } },
      {
        sign = {
          name = { ".*" },
          maxwidth = 1,
          colwidth = 1,
        },
        auto = true,
        click = "v:lua.ScSa",
      },
      {
        text = { " ", " ", builtin.lnumfunc, " " },
        click = "v:lua.ScLa",
        condition = { true, builtin.not_empty },
      },
      -- Segment: Add padding
      {
        text = { " " },
        hl = "Normal",
        condition = { true, builtin.not_empty },
      },
    },
  }
end

M.ufo = function()
  require("ufo").setup {
    close_fold_kinds_ft= { "imports" },
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  }
end

return M
