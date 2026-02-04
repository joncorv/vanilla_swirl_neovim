return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter", branch = "main" },
  event = { "BufReadPost", "BufNewFile" },

  init = function()
    -- Disable built-in ftplugin mappings to avoid conflicts
    vim.g.no_plugin_maps = true
  end,

  config = function()
    -- Main branch setup - configure select and move options
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
          ["@class.outer"] = "V",
        },
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    })

    -- Selection keymaps
    local select = require("nvim-treesitter-textobjects.select")

    local select_maps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["ai"] = "@conditional.outer",
      ["ii"] = "@conditional.inner",
    }

    for key, query in pairs(select_maps) do
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end, { desc = "Select " .. query })
    end

    -- Movement keymaps
    local move = require("nvim-treesitter-textobjects.move")

    -- Next start
    vim.keymap.set({ "n", "x", "o" }, "]m", function()
      move.goto_next_start("@function.outer", "textobjects")
    end, { desc = "Next function start" })

    vim.keymap.set({ "n", "x", "o" }, "]]", function()
      move.goto_next_start("@class.outer", "textobjects")
    end, { desc = "Next class start" })

    vim.keymap.set({ "n", "x", "o" }, "]a", function()
      move.goto_next_start("@parameter.inner", "textobjects")
    end, { desc = "Next parameter" })

    -- Next end
    vim.keymap.set({ "n", "x", "o" }, "]M", function()
      move.goto_next_end("@function.outer", "textobjects")
    end, { desc = "Next function end" })

    vim.keymap.set({ "n", "x", "o" }, "][", function()
      move.goto_next_end("@class.outer", "textobjects")
    end, { desc = "Next class end" })

    -- Previous start
    vim.keymap.set({ "n", "x", "o" }, "[m", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Previous function start" })

    vim.keymap.set({ "n", "x", "o" }, "[[", function()
      move.goto_previous_start("@class.outer", "textobjects")
    end, { desc = "Previous class start" })

    vim.keymap.set({ "n", "x", "o" }, "[a", function()
      move.goto_previous_start("@parameter.inner", "textobjects")
    end, { desc = "Previous parameter" })

    -- Previous end
    vim.keymap.set({ "n", "x", "o" }, "[M", function()
      move.goto_previous_end("@function.outer", "textobjects")
    end, { desc = "Previous function end" })

    vim.keymap.set({ "n", "x", "o" }, "[]", function()
      move.goto_previous_end("@class.outer", "textobjects")
    end, { desc = "Previous class end" })

    -- Repeatable movements with ; and ,
    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next, { desc = "Repeat move next" })
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, { desc = "Repeat move prev" })

    -- Make f, F, t, T repeatable
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
