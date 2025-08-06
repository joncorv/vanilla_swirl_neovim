-- Set up rust-analyzer using built-in vim.lsp.config
vim.lsp.config["rust_analyzer"] = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "Cargo.lock" },
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "cargo check",
            },
            cargo = {
                allFeatures = true,
            },
        },
    },
}

vim.lsp.enable("rust_analyzer")

--
-- -- Enable the LSP for Rust files
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'rust',
--   callback = function(args)
--     vim.lsp.start({ name = 'rust_analyzer', bufnr = args.buf })
--   end,
-- })
