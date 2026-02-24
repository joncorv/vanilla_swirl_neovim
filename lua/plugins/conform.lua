return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      -- JS/TS/Vue: ESLint's BufWritePre autocmd (eslint.applyAllFixes) owns these
    },
    format_on_save = function(bufnr)
      local js_fts = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
      if vim.tbl_contains(js_fts, vim.bo[bufnr].filetype) then
        return { timeout_ms = 3000, lsp_format = "prefer" }
      end
      return { timeout_ms = 2000, lsp_format = "fallback" }
    end,
  },
}
