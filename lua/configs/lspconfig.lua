local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults()

local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "lua_ls",
  "clangd",
  "pyright",
  "jdtls",
  "zls",
  "ols",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.old.setup {}
