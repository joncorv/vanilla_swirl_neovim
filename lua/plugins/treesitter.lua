return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Lastest commits for Nightly compatibility
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- On Windows Nightly, sometimes Lazy hasn't finished indexing the RTP
    -- This pcall is the safest way to initialize
    local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    ts_configs.setup({
      -- Auto-installing parsers
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "vue",
        "typescript",
        "javascript",
        "rust",
        "ron",
        "css",
        "python",
        "html",
        "json",
        "jsonc",
        "nix",
        "bash",
        "toml",
      },
      highlight = { enable = true },
      indent = { enable = true },

      -- Textobjects setup
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
      },
    })

    -- Toggle for Neovim 0.12 Nightly
    vim.keymap.set("n", "<leader>ut", function()
      local buf = vim.api.nvim_get_current_buf()
      local is_active = vim.treesitter.highlighter.active[buf]
      if is_active then
        vim.treesitter.stop(buf)
        vim.notify("Treesitter Off")
      else
        vim.treesitter.start(buf)
        vim.notify("Treesitter On")
      end
    end, { desc = "Toggle Treesitter" })
  end,
}
