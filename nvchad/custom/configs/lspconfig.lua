local join_paths = require("custom.configs.utils").join_paths

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "csharp_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.powershell_es.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  bundle_path = vim.fs.normalize(join_paths(vim.fn.stdpath("data"), "/mason/packages/powershell-editor-services")),
  shell = 'powershell.exe',
}
