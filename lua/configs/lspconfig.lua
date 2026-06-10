local nvlsp = require "nvchad.configs.lspconfig"
local dap = require "dap"
local dapui = require "dapui"

nvlsp.defaults()

-- Define servers
local servers = {
  "lua_ls",
  "clangd",
  "zls",
  "ols",
  "gopls",
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

-- UNIX only but whatever
local user = os.getenv "USER"
local m_command = string.format("/home/%s/codelldb/adapter/codelldb", user)

-- Debugging settings
dap.adapters.lldb = {
  type = "executable",
  command = m_command,
  name = "codelldb",
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
