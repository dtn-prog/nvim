return {
  {
    "VidocqH/lsp-lens.nvim",
    config = function()
      require("lsp-lens").setup({
        enable = true,
        include_declaration = false, -- whether to count declaration as a “reference”
        sections = {
          definition = function(count)
            return "Defs: " .. count
          end,
          references = function(count)
            return "Refs: " .. count
          end,
          implements = function(count)
            return "Impls: " .. count
          end,
          git_authors = function(latest_author, count)
            return " " .. latest_author .. (count > 1 and (" + " .. (count - 1)) or "")
          end,
        },
        ignore_filetype = {
          "prisma",
        },
        target_symbol_kinds = {
          -- what kinds of symbols to show lens for (Function, Method, Interface, etc.)
          vim.lsp.protocol.SymbolKind.Function,
          vim.lsp.protocol.SymbolKind.Method,
          vim.lsp.protocol.SymbolKind.Interface,
        },
        wrapper_symbol_kinds = {
          -- symbol kinds that may wrap other kinds; for example, Class may wrap Method
          vim.lsp.protocol.SymbolKind.Class,
          vim.lsp.protocol.SymbolKind.Struct,
        },
      })

      vim.api.nvim_set_hl(0, "LspLens", { link = "Comment" })
    end,
  },
}
