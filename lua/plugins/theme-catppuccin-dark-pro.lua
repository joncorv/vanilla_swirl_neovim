return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("catppuccin")
      require("catppuccin").setup({
        flavour = "mocha",
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          keywords = { "bold" },
          functions = { "bold" },
        },
        color_overrides = {
          mocha = {
            base = "#1a1a2e", -- Darker background (from editor.background)
          },
        },
        custom_highlights = function(colors)
          return {
            -- Token color overrides from your VS Code config
            ["@comment"] = { fg = "#6c7086", style = { "italic" } }, -- Dimmer comments
            ["@string"] = { fg = "#a6e3a1" }, -- Brighter strings
            ["@keyword"] = { fg = "#cba6f7", style = { "bold" } }, -- Enhanced keywords
            ["@function"] = { fg = "#89b4fa", style = { "bold" } }, -- Vibrant functions
            ["@function.call"] = { fg = "#89b4fa" },

            -- Keep the Dark Pro syntax philosophy
            ["@variable"] = { fg = colors.red },
            ["@parameter"] = { fg = colors.red },
            ["@property"] = { fg = colors.peach },
            ["@type"] = { fg = colors.yellow },
            ["@number"] = { fg = colors.peach },
          }
        end,
      })
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
}
