local plugins = {
  {
    "kevinhwang91/nvim-ufo",
    event = "VimEnter",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("configs.ufo").statuscol()
        end,
      },
    },
    config = function()
      require("configs.ufo").ufo()
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "VimEnter",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      {
        "anuvyklack/fold-preview.nvim",
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require "configs.prettyfold"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = require "configs.nvim-tree",
  },

  {
    "NvChad/nvterm",
    opts = require "configs.nvterm",
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  { "tpope/vim-repeat", lazy = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  { "ggandor/lightspeed.nvim", lazy = false },
  {
    "gbprod/substitute.nvim",
    event = "VeryLazy",
    config = function()
      require("substitute").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  -- git
  { "tpope/vim-fugitive", lazy = false },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "configs.lazygit"
    end,
  },

  { "f-person/git-blame.nvim", lazy = false },

  { "sindrets/diffview.nvim", lazy = false },

  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    version = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },
  -- autocomplete
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.nvim-cmp",
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
      },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "LspAttach",
    -- lazy = false,
    config = function()
      require "configs.lspsaga"
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    after = "mason-lspconfig.nvim",
  },

  -- dap
  {
    "aserowy/tmux.nvim",
    lazy = false,
    config = function()
      return require("tmux").setup()
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      return require("notify").setup {
        background_colour = "#000000",
      }
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require "configs.auto-session"
    end,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>" },
    },
  },

  -- ["rmagatti/goto-preview"] = {
  --   config = function()
  --     require("goto-preview").setup { opacity = 20, dismiss_on_move = true }
  --   end,
  -- },

  { "MattesGroeger/vim-bookmarks", lazy = false },

  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require "configs.neoclip"
    end,
    dependencies = {
      { "kkharji/sqlite.lua" },
      { "nvim-telescope/telescope.nvim" },
    },
  },

  { "nacro90/numb.nvim" },

  -- docs
  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    config = function()
      require "configs.vim-doge"
    end,
    cmd = { "DogeGenerate", "DogeCreateDocStandard" },
  },

  -- ["danymat/neogen"] = {
  --   c} = {} = {} = {onfig = function() require("neogen").setup(require "user.plugins.neogen-conf") end,
  -- },

  -- notetaking
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/Library/CloudStorage/Box-Box/Notes/**.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require "configs.obsidian"
    end,
    -- opts = require "configs.obsidian",
  },

  -- ui
  {
    "tiagovla/scope.nvim",
    lazy = false,
    config = function()
      require("scope").setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
  },

  -- themes
  { "folke/tokyonight.nvim" },
  { "rebelot/kanagawa.nvim" },

  ["EdenEast/nightfox.nvim"] = {
    config = function()
      require("nightfox").setup {
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      }
    end,
  },

  ["ellisonleao/gruvbox.nvim"] = {
    config = function()
      require("gruvbox").setup {
        contrast = "soft",
        transparent_mode = true,
        overrides = {
          StatusLine = { bg = "#282828" },
        },
      }
    end,
  },
}

return plugins
