--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Toggle Neotree in current directory and reveal current file
vim.keymap.set("n", "\\", ":Neotree toggle current reveal_force_cwd<CR>", {
  desc = "Toggle Neotree (current dir, reveal file)",
  silent = true,
  noremap = true,
})

-- Reveal current file in Neotree
vim.keymap.set("n", "|", ":Neotree reveal<CR>", {
  desc = "Reveal current file in Neotree",
  silent = true,
  noremap = true,
})

-- Yank no longer replaces any overwtitten text in the register
vim.keymap.set("x", "p", "P", { silent = true })

-- Select All in buffer
vim.keymap.set("n", "<leader>a", "<ESC>ggVG", {
  desc = "Select [a]ll in buffer",
  silent = true,
  noremap = true,
})
