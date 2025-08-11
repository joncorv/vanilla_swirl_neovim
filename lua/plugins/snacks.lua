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
      -- files = { enabled = true },
      bufdelete = { enabled = true },
    },
    keys = {

      {
        "<Leader>gg",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Open Lazygit",
      },

      {
        "<Leader>D",
        function()
          Snacks.dashboard.open()
        end,
        desc = "Open Dashboard",
      },
      {
        "<C-/>",
        function()
          Snacks.terminal.toggle()
        end,
        mode = { "n", "t" }, -- Specify modes here
        desc = "Toggle Terminal",
      },
      {
        "<Leader>bd",
        function()
          Snacks.bufdelete.delete()
        end,
        desc = "Delete Current Buffer",
      },
    },
  },
}
