-- remove the annoyinng cursor animations
-- if neovide is in use
--
if vim.g.neovide then
  -- fix the crappy cursory animation
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  -- fix the smooth scrolling bs
  -- vim.g.neovide_position_animation_length = 0.0025
  vim.g.neovide_scroll_animation_far_lines = 1
  vim.g.neovide_scroll_animation_length = 0.1

  -- Transparency Settings
  vim.g.neovide_opacity = 0.75
  vim.g.normal_opacity = 0.75
  vim.g.neovide_show_border = true
  vim.g.neovide_window_blurred = true
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "#0a0a0f" }) -- near-black with a slight tint

  -- font settings
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.o.guifont = "Maple Mono NF:h14"
  -- fix fullscreen
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})

  -- keymaps for making text larger and smaller
  -- vim.g.neovide_scale_factor = 1.0
  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
    print("neovide scale factor =", vim.g.neovide_scale_factor)
  end, { desc = "Neovide Scale Up" })

  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
    print("neovide scale factor =", vim.g.neovide_scale_factor)
  end, { desc = "Neovide Scale Down" })
end
