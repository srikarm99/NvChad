local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xw",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
    },
  {
    "kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = "BufReadPost", -- needed for folds to load properly
  },
  {
	"chrisgrieser/nvim-origami",
	event = "BufReadPost", -- later or on keypress would prevent saving folds
  lazy = false,
	opts = true, -- needed even when using default config
},
{
    'saecki/crates.nvim',
    ft={"rust", "toml"},
    tag = 'stable',
    config = function()
        require('crates').setup{
          completion = {
            cmp = {
              enabled = true
            },
            crates = {
            enabled = true,
          }
          }
        }
    end,
},
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require('nvim-ts-autotag').setup({
          opts = {
              -- Defaults
              enable_close = true, -- Auto close tags
              enable_rename = true, -- Auto rename pairs of tags
              enable_close_on_slash = false -- Auto close on trailing </
            },
      })
    end,
    lazy = true,
    event = "VeryLazy"
  },
  -- ,
-- {
--   {
--       "zbirenbaum/copilot.lua",
--       cmd = "Copilot",
--       event = "InsertEnter",
--       config = function()
--   require('copilot').setup({
--     panel = {
--       enabled = true,
--       auto_refresh = false,
--       keymap = {
--         jump_prev = "[[",
--         jump_next = "]]",
--         accept = "<CR>",
--         refresh = "gr",
--         open = "<M-CR>"
--       },
--       layout = {
--         position = "bottom", -- | top | left | right
--         ratio = 0.4
--       },
--     },
--     suggestion = {
--       enabled = true,
--       auto_trigger = false,
--       debounce = 75,
--       keymap = {
--         accept = "<M-l>",
--         accept_word = false,
--         accept_line = false,
--         next = "<M-]>",
--         prev = "<M-[>",
--         dismiss = "<C-]>",
--       },
--     },
--     filetypes = {
--       ["*"] = true,
--     },
--     copilot_node_command = 'node', -- Node.js version must be > 18.x
--     server_opts_overrides = {},
--   })
--         end
--     },
--   }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
