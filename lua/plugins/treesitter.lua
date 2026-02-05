-- lua/plugins/treesitter.lua
-- Core nvim-treesitter setup (main branch, 2025+)

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- main branch does NOT support lazy loading
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },

  config = function()
    -- Main branch setup (only install_dir is supported, defaults are fine)
    require("nvim-treesitter").setup({})

    -- Parsers to install (main branch uses .install() not ensure_installed)
    local parsers = {
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
    }

    -- Install missing parsers (async, no-op if already installed)
    require("nvim-treesitter").install(parsers)

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
