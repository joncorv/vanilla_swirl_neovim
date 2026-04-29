return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      javascript = { "eslint_d", "prettierd" },
      javascriptreact = { "eslint_d", "prettierd" },
      typescript = { "eslint_d", "prettierd" },
      typescriptreact = { "eslint_d", "prettierd" },
      vue = { "eslint_d", "prettierd" },
      wgsl = { lsp_format = "prefer" },
    },
    format_on_save = { timeout_ms = 2000, lsp_format = "fallback" },
  },
}
