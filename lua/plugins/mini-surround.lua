return {
  "nvim-mini/mini.surround",
  version = "*",

  opts = {
    custom_surroundings = nil,
    highlight_duration = 500,

    mappings = {
      add = "sa", -- Add surrounding in Normal and Visual modes
      delete = "sd", -- Delete surrounding
      find = "sf", -- Find surrounding (to the right)
      find_left = "sF", -- Find surrounding (to the left)
      highlight = "sh", -- Highlight surrounding
      replace = "sr", -- Replace surrounding
    },

    -- Number of lines within which surrounding is searched
    n_lines = 20,

    -- Whether to disable showing non-error feedback
    -- This also affects (purely informational) helper messages shown after
    -- idle time if user input is required.
    silent = false,
  },
}
