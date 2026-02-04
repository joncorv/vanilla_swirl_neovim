return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "vue-language-server",
        "vtsls",
        "rust-analyzer",
        "prettierd",
        "prettier",
        "tailwindcss-language-server",
        "shfmt",
        "json-lsp",
        "pyright",
        "black",
        "isort",
        "bash-language-server",
        "ts_ls",
      },

      auto_update = false,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,
    })
  end,
}
