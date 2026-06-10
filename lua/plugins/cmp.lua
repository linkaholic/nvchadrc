return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    local types = require "cmp.types"

    opts.sources = cmp.config.sources {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "nvim_lua" },
    }

    local function deprioritize_snippets(entry1, entry2)
      local kind1 = entry1:get_kind()
      local kind2 = entry2:get_kind()
      local snippet_kind = types.lsp.CompletionItemKind.Snippet

      if kind1 == snippet_kind and kind2 ~= snippet_kind then
        return false
      elseif kind2 == snippet_kind and kind1 ~= snippet_kind then
        return true
      end
    end

    opts.sorting = {
      comparators = {
        deprioritize_snippets,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    }
  end,
}
