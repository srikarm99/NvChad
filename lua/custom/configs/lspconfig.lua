local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "bufls", "html", "cssls", "tsserver", "basedpyright", "rust_analyzer", "gopls",
  "metals", "svelte", "jdtls", "terraformls"}
-- 
-- local servers = lspconfig.util.available_servers() -- or list servers manually like {'gopls', 'clangd'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require('ufo').setup()


-- 
-- lspconfig.pyright.setup { blabla}
