return {
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Minimal setup - this should provide default styles
      require("eldritch").setup()
      vim.cmd.colorscheme("eldritch")
    end,
  },
}
