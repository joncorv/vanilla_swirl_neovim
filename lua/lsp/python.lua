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

if vim.uv.os_uname().sysname:find("Darwin") then
  vim.g.python3_host_prog = "uv"
end
