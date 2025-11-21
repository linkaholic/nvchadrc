return {
  "neovim/nvim-lspconfig",
  config = function()
    require "configs.lspconfig"
    -- Setup Roslyn for csharp lsp
    require "roslyn"
  end,
}
