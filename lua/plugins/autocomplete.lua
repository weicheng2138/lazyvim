return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
      { "onsails/lspkind.nvim" },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local lspkind = require("lspkind")
      opts.formatting.format = lspkind.cmp_format({
        mode = "symbol_text",
        menu = {
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        },
      })
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
