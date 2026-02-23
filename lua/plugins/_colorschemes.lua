return {
  {
    "eldritch-theme/eldritch.nvim",
    event = "VeryLazy",
    config = function()
      require("eldritch").setup()
    end,
  },

  -- {
  --   "olimorris/onedarkpro.nvim",
  --   config = function()
  --     require("onedarkpro").setup()
  --     -- vim.cmd("colorscheme onelight")
  --   end,
  -- },
  --
  -- { "scottmckendry/cyberdream.nvim" },
  { "tiagovla/tokyodark.nvim", event = "VeryLazy" },
  -- { "akinsho/horizon.nvim" },
  -- { "diegoulloao/neofusion.nvim" },
  {
    "folke/tokyonight.nvim",

    config = function()
      require("tokyonight").setup()
      vim.cmd.colorscheme("tokyonight-storm")
    end,
  },
  -- { "rose-pine/neovim" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "EdenEast/nightfox.nvim" },
  -- { "sainnhe/everforest" },
  -- { "Mofiqul/dracula.nvim" },
  -- { "AlexvZyl/nordic.nvim" },
  -- { "neanias/everforest-nvim" },
  -- { "ribru17/bamboo.nvim" },
  -- { "rmehri01/onenord.nvim" },
  -- { "savq/melange-nvim" },
  -- { "olivercederborg/poimandres.nvim" },
  -- {
  --   "0xstepit/flow.nvim",
  -- },
  -- { "oxfist/night-owl.nvim" },
  -- { "mhartington/oceanic-next" },
  -- { "xero/miasma.nvim" },
  -- { "dgox16/oldworld.nvim" },
  -- { "uloco/bluloco.nvim", dependencies = { "rktjmp/lush.nvim" } },
  -- { "sho-87/kanagawa-paper.nvim" },
  -- { "Everblush/nvim" },

  {
    "shaunsingh/moonlight.nvim",
    event = "VeryLazy",
  },

  -- { "gbprod/nord.nvim" },
  -- { "samharju/synthweave.nvim" },
  -- { "mellow-theme/mellow.nvim" },
  -- { "cpea2506/one_monokai.nvim" },
  -- { "glepnir/zephyr-nvim" },
  -- { "titanzero/zephyrium" },
  -- { "cryptomilk/nightcity.nvim" },
  -- { "alexmozaidze/palenight.nvim" },
  { "sontungexpt/witch", event = "VeryLazy" },
  { "niyabits/calvera-dark.nvim", event = "VeryLazy" },
  { "talha-akram/noctis.nvim", event = "VeryLazy" },
  -- { "github-main-user/lytmode.nvim" },
  -- {
  --   "maxmx03/fluoromachine.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
    -- priority = 1000,
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
