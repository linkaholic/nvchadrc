local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()

-- Define servers
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

-- Configure each server
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.lsp.enable(servers)
