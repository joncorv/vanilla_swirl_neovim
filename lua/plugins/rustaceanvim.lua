-- using rustaceanvim for rust LSP!

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = true,
              check = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      }
    end,
  },
  {
    "Saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup({})
    end,
  },
}
