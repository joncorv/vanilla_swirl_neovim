return {

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = { enabled = true },
      lazygit = { enabled = true },
      terminal = { enabled = true },
      notifier = { enabled = true },
      -- explorer = { enabled = true },
    },
    keys = {

      { "<Leader>gg", ":lua Snacks.lazygit.open()<CR>", desc = "Open Lazygit" },
      { "<Leader>D", ":lua Snacks.dashboard.open()<CR>", desc = "Open Dashboard" },
      {
        "<C-/>",
        function()
          Snacks.terminal.toggle()
        end,
        mode = { "n", "t" }, -- Specify modes here
        desc = "Toggle Terminal",
      },
    },
  },
}
