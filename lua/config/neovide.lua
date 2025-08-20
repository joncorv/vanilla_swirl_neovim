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
  -- font settings
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  -- fix fullscreen
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
