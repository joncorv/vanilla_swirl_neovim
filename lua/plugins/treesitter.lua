-- lua/plugins/treesitter.lua
-- Core nvim-treesitter setup (main branch, 2025+)

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },

  config = function()
    -- The main branch uses require("nvim-treesitter").setup()
    -- NOT the old require("nvim-treesitter.configs").setup()
    require("nvim-treesitter").setup({
      -- Parsers to install (add your languages here)
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "rust",
        "toml",
        "typescript",
        "vue",
        "yaml",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
    })

    -- Neovim 0.10+ has native treesitter highlighting via vim.treesitter.start()
    -- This autocmd enables it for buffers with available parsers
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
      callback = function(args)
        -- pcall handles filetypes without parsers gracefully
        pcall(vim.treesitter.start, args.buf)
      end,
    })

    -- Toggle treesitter highlighting
    vim.keymap.set("n", "<leader>ut", function()
      local buf = vim.api.nvim_get_current_buf()
      if vim.treesitter.highlighter.active[buf] then
        vim.treesitter.stop(buf)
        vim.notify("Treesitter highlighting disabled", vim.log.levels.WARN)
      else
        vim.treesitter.start(buf)
        vim.notify("Treesitter highlighting enabled", vim.log.levels.INFO)
      end
    end, { desc = "Toggle Treesitter highlighting" })
  end,
}
