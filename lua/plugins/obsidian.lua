return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Load only for Markdown paths containing "Obsidian Vault".
  event = {
    "BufReadPre *Obsidian Vault*/**.md",
    "BufNewFile *Obsidian Vault*/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ui = { enable = false },
    workspaces = {
      {
        name = "Obsidian_Vault",
        -- Resolve the vault from the current buffer instead of an OS-specific path.
        path = function()
          return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
      },
    },
    picker = {
      name = "fzf-lua",
    },
  },
}
