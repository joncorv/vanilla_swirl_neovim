return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- Install parsers
    ts.install({
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
    })

    -- Enable treesitter highlighting for all filetypes
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- toggle on and off treesitter when i hit heavy files
    vim.keymap.set("n", "<leader>ut", function()
      local buf = vim.api.nvim_get_current_buf()
      if vim.b[buf].ts_highlight then
        vim.treesitter.stop(buf)
      else
        vim.treesitter.start(buf)
      end
    end, { desc = "Toggle Treesitter" })
  end,
}
