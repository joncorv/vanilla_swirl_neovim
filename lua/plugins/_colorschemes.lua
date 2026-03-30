return {
  -- ###########################################
  -- LOW CONTRAST THEMES I LIKE
  -- ###########################################
  {
    "rose-pine/neovim",
    config = function()
      vim.cmd.colorscheme("rose-pine-moon")
    end,
  },
  { "webhooked/kanso.nvim" },
  { "oahlen/iceberg.nvim" },
  { "aktersnurra/no-clown-fiesta.nvim" },
  { "kvrohit/substrata.nvim" },
  { "kdheepak/monochrome.nvim" },
  { "savq/melange-nvim" },
  { "e-ink-colorscheme/e-ink.nvim" },
  { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },

  -- ###########################################
  -- HIGH CONTRAST RAINBOW PUKE THEMES
  -- ###########################################

  { "folke/tokyonight.nvim" },
  { "eldritch-theme/eldritch.nvim" },
  { "folke/tokyonight.nvim" },
  { "vague-theme/vague.nvim" },
  { "shaunsingh/moonlight.nvim" },
  { "sontungexpt/witch" },
  { "niyabits/calvera-dark.nvim" },
  { "tiagovla/tokyodark.nvim" },

  -- { "shaunsingh/seoul256.nvim" },
  -- { "talha-akram/noctis.nvim" },
  -- { "olimorris/onedarkpro.nvim" },
  -- { "akinsho/horizon.nvim" },
  -- { "diegoulloao/neofusion.nvim" },
  -- { "scottmckendry/cyberdream.nvim" },
  -- { "gbprod/nord.nvim" },
  -- { "samharju/synthweave.nvim" },
  -- { "mellow-theme/mellow.nvim" },
  -- { "cpea2506/one_monokai.nvim" },
  -- { "glepnir/zephyr-nvim" },
  -- { "titanzero/zephyrium" },
  -- { "cryptomilk/nightcity.nvim" },
  -- { "alexmozaidze/palenight.nvim" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "EdenEast/nightfox.nvim" },
  -- { "sainnhe/everforest" },
  -- { "Mofiqul/dracula.nvim" },
  -- { "AlexvZyl/nordic.nvim" },
  -- { "neanias/everforest-nvim" },
  -- { "ribru17/bamboo.nvim" },
  -- { "rmehri01/onenord.nvim" },
  -- { "olivercederborg/poimandres.nvim" },
  -- { "0xstepit/flow.nvim" },
  -- { "oxfist/night-owl.nvim" },
  -- { "mhartington/oceanic-next" },
  -- { "xero/miasma.nvim" },
  -- { "dgox16/oldworld.nvim" },
  -- { "uloco/bluloco.nvim", dependencies = { "rktjmp/lush.nvim" } },
  -- { "sho-87/kanagawa-paper.nvim" },
  -- { "Everblush/nvim" },
  -- { "github-main-user/lytmode.nvim" },
  -- { "maxmx03/fluoromachine.nvim" },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
    -- priority = 1000,
    config = function()
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
