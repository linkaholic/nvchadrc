local options = {
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    liquid = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    odin = { "odinfmt" },
  },
  formatters = {
    odinfmt = {
      function(bufnr)
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        return {
          exe = "/usr/sbin/odinfmt",
          args = { "-w", filepath },
          stdin = false,
        }
      end,
    },
  },
}

return options
