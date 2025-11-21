require "nvchad.options"

local opt = vim.o

vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- usual settings
opt.swapfile = false
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.wrap = false

-- tabs & spacing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- colors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- splits
opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 190

-- disable persisent undo
opt.undoreload = 0

-- neovide settings
-- vim.g.neovide_opacity = 0.8
-- vim.g.neovide_normal_opacity = 0.8
-- vim.g.neovide_refresh_rate = 60
--

-- Note! This is for windows only, make sure to enable it then
-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write(($([Console]::Out.Encoding = [System.Text.Encoding]::UTF8); Get-Clipboard -Raw).ToString().Replace("`r", ""))',
--     ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write(($([Console]::Out.Encoding = [System.Text.Encoding]::UTF8); Get-Clipboard -Raw).ToString().Replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }
