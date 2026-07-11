return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
  opts = {

    completions = { lsp = { enabled = true } },

    -- sign = {
    --   enabled = false,
    -- },
    preset = "obsidian",
  },
}
