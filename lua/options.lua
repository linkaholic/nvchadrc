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
opt.guifont = "ZedMono Nerd Font Mono"

vim.lsp.inlay_hint.enable()

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

-- function no_paste(reg)
--   return function(lines)
--     --
--   end
-- end
--
-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy "+",
--     ["*"] = require("vim.ui.clipboard.osc52").copy "*",
--   },
--   paste = {
--     -- ["+"] = require("vim.ui.clipboard.osc52").paste "+",
--     -- ["*"] = require("vim.ui.clipboard.osc52").paste "*",
--     ["+"] = no_paste "+",
--     ["*"] = no_paste "*",
--   },
-- }
--

--vim.g.clipboard = "osc52"

-- NOTE: This is used for SSH
function my_paste(reg)
  return function(lines)
    local content = vim.fn.getreg '"'
    return vim.split(content, "\n")
  end
end

if os.getenv "SSH_TTY" == nil then
  vim.opt.clipboard:append "unnamedplus"
else
  vim.opt.clipboard:append "unnamedplus"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      ["+"] = my_paste "+",
      ["*"] = my_paste "*",
    },
  }
end

vim.diagnostic.config { virtual_text = false }

-- Debugger Signs
vim.fn.sign_define("DapBreakpoint", {
  text = "●",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "➡",
  texthl = "DapStopped",
  linehl = "Visual",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "✖",
  texthl = "DapBreakpointRejected",
  linehl = "",
  numhl = "",
})

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e06c75" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#e5c07b" })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#be5046" })

vim.g.rustaceanvim = function()
  -- Update this path
  local extension_path = vim.env.HOME .. "/codelldb/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb"
  local this_os = vim.uv.os_uname().sysname

  -- The path is different on Windows
  if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local cfg = require "rustaceanvim.config"
  return {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end
