require "nvchad.autocmds"
local dap = require "dap"

-- disable autocomment
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.formatoptions:remove { "c", "r", "o" }
  end,
})

vim.api.nvim_create_user_command("DapBuild", function()
  vim.notify("Building Rust project...", vim.log.levels.INFO)

  vim.fn.jobstart({ "cargo", "build" }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Build finished successfully", vim.log.levels.INFO)
      else
        vim.notify("Build failed", vim.log.levels.ERROR)
      end
    end,
  })
end, {})

vim.api.nvim_create_user_command("DapBuildAndLaunch", function()
  vim.notify("Building before debug...", vim.log.levels.INFO)

  vim.fn.jobstart({ "cargo", "build" }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify("Build failed", vim.log.levels.ERROR)
        return
      end

      vim.notify("Build OK — starting debugger", vim.log.levels.INFO)
      dap.continue()
    end,
  })
end, {})

vim.api.nvim_create_user_command("Run", function()
  local ft = vim.bo.filetype

  local cmd

  if ft == "rust" then
    cmd = { "cargo", "build" }
  elseif ft == "odin" then
    cmd = { "odin", "build", "src/", "-debug", "-out:./build/main" }
  else
    vim.notify("Unsupported filetype: " .. ft, vim.log.levels.ERROR)
    return
  end

  vim.notify("Building...", vim.log.levels.INFO)

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,

    on_exit = function(_, code)
      if code ~= 0 then
        vim.schedule(function()
          vim.notify("Build failed", vim.log.levels.ERROR)
        end)
        return
      end

      vim.schedule(function()
        vim.notify("Build OK", vim.log.levels.INFO)
      end)
    end,
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local clients = vim.lsp.get_clients()
    if #clients > 0 then
      vim.lsp.buf.format({ async = true })
    end
  end,
})
