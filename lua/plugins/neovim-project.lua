return {
  "coffebar/neovim-project",
  lazy = false,
  priority = 100,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "Shatur/neovim-session-manager",
    "ibhagwan/fzf-lua",
  },
  opts = {
    -- Glob patterns for project discovery (used by :NeovimProjectDiscover).
    -- Any directory you open Neovim in is also added to history automatically,
    -- so these only need to cover where you keep clusters of projects.
    projects = {
      "~/Documents/*",
      "~/.config/*",
      "C:/Users/joncorv/AppData/Local/nvim",
      "/Volumes/Projects/Obsidian/Obsidian Vault",
      "Z:/Obsidian/Obsidian Vault",
    },
    -- Only auto-restore when launched from inside a project directory; don't
    -- fall back to the most recent session when opened elsewhere (e.g. ~/.config/nvim).
    last_session_on_startup = false,
    picker = {
      type = "fzf-lua",
      preview = {
        enabled = false,
      },
    },
  },
  init = function()
    -- Persist global variables in the session (needed by session-manager).
    vim.opt.sessionoptions:append("globals")
  end,
  keys = {
    {
      "<leader>fp",
      "<cmd>NeovimProjectHistory<CR>",
      desc = "Find Recent Projects",
    },
    {
      "<leader>fP",
      "<cmd>NeovimProjectDiscover<CR>",
      desc = "Discover Projects",
    },
    -- Session management (via neovim-session-manager, bundled with coffebar).
    -- Sessions auto-save on exit and auto-restore on entering a project; these
    -- are the manual controls, mirroring the old persistence.nvim keymaps.
    {
      "<leader>qs",
      "<cmd>SessionManager load_current_dir_session<CR>",
      desc = "Restore Session",
    },
    {
      "<leader>qS",
      "<cmd>NeovimProjectHistory<CR>",
      desc = "Select Session",
    },
    {
      "<leader>ql",
      "<cmd>SessionManager load_last_session<CR>",
      desc = "Restore Last Session",
    },
    {
      "<leader>qd",
      "<cmd>SessionManager delete_current_dir_session<CR>",
      desc = "Delete Session",
    },
    {
      "<leader>qq",
      function()
        pcall(vim.cmd, "Neotree close")
        vim.cmd("SessionManager save_current_session")
        vim.cmd("qa")
      end,
      desc = "Quit Session",
    },
  },
}
