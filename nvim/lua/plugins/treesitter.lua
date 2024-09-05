return {
  {
    "nvim-treesitter/nvim-treesitter",
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
