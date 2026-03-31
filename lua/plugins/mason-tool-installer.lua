return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "lua_ls",
        "vue-language-server",
        "vtsls",
        "rust-analyzer",
        "tailwindcss-language-server",
        "eslint-lsp",
        "eslint_d",
        "shfmt",
        "json-lsp",
        "pyright",
        "basedpyright",
        "black",
        "isort",
        "bash-language-server",
        "ts_ls",
        "typescript-language-server",
      },

      auto_update = false,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,
    })
  end,
}
