return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Filetype detection for WGSL
    vim.filetype.add({ extension = { wgsl = "wgsl" } })

    -- wgsl_analyzer is not in Mason; install via:
    -- cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl-analyzer
    if vim.fn.executable("wgsl-analyzer") == 1 then
      vim.lsp.config("wgsl_analyzer", {})
      vim.lsp.enable("wgsl_analyzer")
    end
  end,
}
