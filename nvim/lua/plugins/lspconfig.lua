return {
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
}
