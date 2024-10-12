return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "williamboman/mason.nvim",
    config = function ()
      require "configs.mason"
    end,
    -- opts = require "configs.mason",
    -- event = 'BufWritePre', -- uncomment for format on save
  },

}
