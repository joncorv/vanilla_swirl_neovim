-- vim.lsp.enable("basedpyright")
vim.lsp.enable("pyright")

if vim.uv.os_uname().sysname:find("Windows") then
  vim.lsp.config("pyright", {
    settings = {
      python = {
        analysis = {
          stubPath = "./stubs",
        },
      },
    },
  })
end
