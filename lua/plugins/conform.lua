return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      -- Let ESLint handle JS/TS/Vue formatting via LSP fallback
      javascript = {},
      typescript = {},
      vue = {},
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}
