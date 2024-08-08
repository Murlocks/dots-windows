return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "powershell" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        powershell_es = {
          settings = {
            powershell = {
              codeFormatting = {
                preset = "Custom",
                newLineAfterOpenBrace = true,
                newLineAfterCloseBrace = true,
                ignoreOneLineBlock = true,
                alignPropertyValuePairs = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "powershell-editor-services" } },
  },
  {
    "TheLeoP/powershell.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "powershell-editor-services" } },
      },
    },
    opts = {
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "powershell-editor-services" } },
      },
    },
  },
}
