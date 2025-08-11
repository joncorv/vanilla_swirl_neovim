require("lsp.luals")
require("lsp.rust")
require("lsp.vue")
require("lsp.python")

-- vim.lsp.enable("lua_ls", "vue", "rust", "rust_analyzer")

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- LSP keymaps
    map("<Leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<Leader>ca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
    map("<Leader>cr", vim.lsp.buf.references, "[G]oto [R]eferences")
    map("<Leader>ci", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    map("<Leader>cd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    map("<Leader>cD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    -- map("gO", vim.lsp.buf.document_symbols, "Open Document Symbols")
    map("<Leader>cw", vim.lsp.buf.workspace_symbol, "Open Workspace Symbols")
    map("<Leader>ct", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")

    -- This function resolves differences between neovim versions
    ---@param client vim.lsp.Client
    ---@param method vim.lsp.protocol.Method
    ---@param bufnr? integer some lsp support methods only in specific files
    ---@return boolean
    local function client_supports_method(client, method, bufnr)
      -- For Neovim 0.12+, use the modern API
      if vim.fn.has("nvim-0.12") == 1 then
        return client:supports_method(method, { bufnr = bufnr })
      elseif vim.fn.has("nvim-0.11") == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if
      client
      and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
    then
      local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
        end,
      })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
    -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
    --   map("<leader>th", function()
    --     -- Neovim 0.12+ inlay hints API
    --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
    --   end, "[T]oggle Inlay [H]ints")
    -- end
  end,
})
