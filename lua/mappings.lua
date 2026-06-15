require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

map("n", "<leader>cs", ":nohl<CR>", { desc = "Clear search" })

-- Random keymaps that I might not use, maybe remove later?
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Increment number" })

-- Splits
map("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Resize split equally" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to prev tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current file in new tab" })

-- Split control
map("n", "<leader>se", "<C-w>=", { desc = "Resize split equally" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Tabbing and others
map("v", "<Tab>", ">gv", { desc = "Indent to the right" })
map("v", "<S-Tab>", "<gv", { desc = "Indent to the left" })

-- Telescope
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
-- map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent" })
-- map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
-- map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find current" })

-- Workspaces
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save workspace" })
map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore workspace" })

-- LSP
map("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for under cursor" })

-- Adding inserts with normal mode without leaving normal mode
map("n", "<CR>", "o<Esc>")
map("n", "<S-CR>", "O<Esc>")

-- Move easily between the terminals
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])

map("n", "<C-t>", "<cmd>Telescope find_files<CR>")
-- map("n", "<C-w>", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
map("n", "<C-q>", "<C-v>", { desc = "Visual Block (Conflicting)" })

-- Debug Mappings
local dap = require "dap"

-- Debugger mappings aligned with Visual Studio 2022
map("n", "<F3>", dap.toggle_breakpoint, { desc = "Debug Toggle Breakpoint" })
map("n", "<F4>", dap.continue, { desc = "Debug Continue" })
map("n", "<F18>", dap.terminate, { desc = "Debug Stop" })
map("n", "<F6>", dap.step_over, { desc = "Debug Step Over" })
map("n", "<F7>", dap.step_into, { desc = "Debug Step Into" })
map("n", "<F19>", dap.step_out, { desc = "Debug Step Out" })

map("n", "<F23>", ":Run<CR>", { desc = "Run debugging" })

map("n", "<A-e>", function()
  require("dapui").toggle()
end, { desc = "DAP UI Toggle" })

vim.keymap.set("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP format" })
