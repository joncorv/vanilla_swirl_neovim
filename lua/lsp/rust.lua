vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
      checkOnSave = {
        command = "cargo clippy",
      },
      cargo = {
        allFeatures = true,
      },
    },
  },
})

vim.lsp.enable("rust_analyzer")
