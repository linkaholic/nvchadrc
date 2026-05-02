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
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find current" })

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
vim.keymap.set("n", "<CR>", "m`o<Esc>``")
vim.keymap.set("n", "<S-CR>", "m`O<Esc>``")

-- Move easily between the terminals
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
