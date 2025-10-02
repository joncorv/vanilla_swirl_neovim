return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  keys = {
    {
      -- keymap to toggle indent guides on and off
      "<leader>ug",
      function()
        local ibl = require("ibl")
        if vim.g.ibl_enabled == false then
          ibl.setup_buffer(0, { enabled = true })
          vim.g.ibl_enabled = true
          vim.notify("Indent guides enabled", vim.log.levels.INFO)
        else
          ibl.setup_buffer(0, { enabled = false })
          vim.g.ibl_enabled = false
          vim.notify("Indent guides disabled", vim.log.levels.INFO)
        end
      end,
      desc = "Indention [G]uides",
    },
  },
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")

    -- Create the highlight groups using theme colors
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- Get theme colors dynamically
      local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or 0x000000
      local comment_fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg or 0x5c6370

      -- Create a much more subtle color for regular indent guides
      local function blend_colors(fg, bg, alpha)
        local function extract_rgb(color)
          return bit.rshift(color, 16), bit.rshift(bit.band(color, 0xff00), 8), bit.band(color, 0xff)
        end

        local fg_r, fg_g, fg_b = extract_rgb(fg)
        local bg_r, bg_g, bg_b = extract_rgb(bg)

        local r = math.floor(fg_r * alpha + bg_r * (1 - alpha))
        local g = math.floor(fg_g * alpha + bg_g * (1 - alpha))
        local b = math.floor(fg_b * alpha + bg_b * (1 - alpha))

        return bit.lshift(r, 16) + bit.lshift(g, 8) + b
      end

      -- Create very subtle indent color (30% opacity of comment color)
      local subtle_color = blend_colors(comment_fg, normal_bg, 0.3)

      vim.api.nvim_set_hl(0, "IblIndent", { fg = string.format("#%06x", subtle_color) })

      -- Rainbow colors for active scope only - use theme colors
      vim.api.nvim_set_hl(
        0,
        "RainbowRed",
        { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticError" }).fg or "#E06C75" }
      )
      vim.api.nvim_set_hl(
        0,
        "RainbowYellow",
        { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" }).fg or "#E5C07B" }
      )
      vim.api.nvim_set_hl(
        0,
        "RainbowBlue",
        { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo" }).fg or "#61AFEF" }
      )
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = vim.api.nvim_get_hl(0, { name = "Number" }).fg or "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = vim.api.nvim_get_hl(0, { name = "String" }).fg or "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = vim.api.nvim_get_hl(0, { name = "Keyword" }).fg or "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = vim.api.nvim_get_hl(0, { name = "Function" }).fg or "#56B6C2" })
    end)

    require("ibl").setup({
      indent = {
        -- char = "│",
        -- tab_char = "│",
        -- Use very subtle color for non-active guides
        highlight = "IblIndent",
        smart_indent_cap = true,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = false, -- Keep false by default
        -- Use rainbow colors only for active scope
        highlight = highlight,
        priority = 500,
        include = {
          node_type = {
            ["*"] = { "*" },
          },
        },
      },
      exclude = {
        filetypes = {
          "Trouble",
          "alpha",
          "dashboard",
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "notify",
          "snacks_dashboard",
          "snacks_notif",
          "snacks_terminal",
          "snacks_win",
          "toggleterm",
          "trouble",
        },
        buftypes = { "terminal", "nofile" },
      },
    })

    -- Integration with Rainbow Delimiters
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- Vue-specific configuration for injected languages
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "vue",
      callback = function()
        require("ibl").setup_buffer(0, {
          scope = {
            injected_languages = true,
          },
        })
      end,
    })

    -- Initialize the toggle state
    vim.g.ibl_enabled = true
  end,
}
