require("nvchad.configs.lspconfig").defaults()

local servers = {
  "ols",
  "lua_ls",
  "clangd",
  "zls",
  "gopls",
}

vim.lsp.enable(servers)

local dap = require "dap"
local dapui = require "dapui"
-- UNIX only but whatever
local user = os.getenv "USER"
local m_command = string.format("/home/%s/codelldb/adapter/codelldb", user)

-- Debugging settings
dap.adapters.lldb = {
  type = "executable",
  command = m_command,
  name = "codelldb",
}

dap.configurations.odin = {
  {
    name = "Debug Odin (src)",
    type = "lldb",
    request = "launch",
    program = vim.fn.getcwd() .. "/build/main",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
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
