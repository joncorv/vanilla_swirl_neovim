vim.lsp.config("eslint", {
  settings = {
    workingDirectories = { mode = "auto" },
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = { enable = true },
    },
    format = false,
    nodePath = "",
    onIgnoredFiles = "off",
    problems = { shortenToSingleLine = false },
    -- "onType" gives live diagnostics as you type (e.g. Nuxt rule violations inline)
    run = "onType",
    validate = "on",
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
})

vim.lsp.enable("eslint")

