return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

  config = function()
    local dapui = require "dapui"

    dapui.setup {
      icons = { expanded = "▾", collapsed = "▸" },

      layouts = {
        {
          position = "right",
          size = 45,
          elements = {
            { id = "scopes", size = 0.33 },
            { id = "stacks", size = 0.33 },
            { id = "breakpoints", size = 0.33 },
          },
        },
        {
          position = "bottom",
          size = 12,
          elements = {
            { id = "repl", size = 0.33 },
            { id = "console", size = 0.33 },
            { id = "watches", size = 0.33 },
          },
        },
      },

      -- Ensures UI labels like "DAP Scopes", "DAP Stacks", etc. stay visible
      render = {
        max_type_length = nil,
        max_value_lines = 100,
      },
    }
  end,
}
