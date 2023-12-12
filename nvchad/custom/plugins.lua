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
    opts = overrides.treesitter
    -- config = function()
    --   local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    --   parser_config.powershell = {
    --     install_info = {
    --       url = "https://github.com/jrsconfitto/tree-sitter-powershell",
    --       files = {"src/parser.c"}
    --     },
    --     filetype = "ps1",
    --     used_by = { "psm1", "psd1", "pssc", "psxml", "cdxml" }
    --   }
    -- end,
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
    "j-hui/fidget.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("fidget").setup()
    end,
  },

  {
    "ggandor/leap.nvim",
    keys = { "s", "S", "gs", "x", "X" },
    config = function()
      require("leap").add_default_mappings()
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward-to)')
      vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward-to)')
    end,
  },

  {
    "tpope/vim-surround",
    keys = { "y", "d", "S" },
  },

  {
    "tpope/vim-repeat",
    keys = { "." },
  },

  {
    "PProvost/vim-ps1",
    ft = "ps1"
  }

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
