return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufReadPost",
  opts = {
    -- ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_enable = {
      exclude = {
        "rust_analyzer",
        "ts_ls",
        "vue",
        "lua_ls",
        -- "python",
        "pyright",
        -- "basedpyright",
        -- "tailwindcss",
        "eslint",
      },
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
