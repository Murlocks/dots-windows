return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")

      --- @class parser_config
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.powershell = {
        install_info = {
          url = "~/code/repos/tree-sitter-powershell", -- local path or git repo
          files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          branch = "main", -- default branch in case of git repo if different from master
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = "ps1", -- if filetype does not match the parser name
      }
    end,
    keys = {
      { "v", desc = "Increment Selection" },
      { "V", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "v",
          node_decremental = "V",
        },
      },
    },
  },
}
