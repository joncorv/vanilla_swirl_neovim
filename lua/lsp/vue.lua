local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
}

local vtsls_config = {
    cmd = { "vtsls", "--stdio" }, -- Add this line
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

local vue_ls_config = {
    cmd = { "vue-language-server", "--stdio" }, -- Add this line
    filetypes = { "vue" },
}

vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.enable({ "vtsls", "vue_ls" })
