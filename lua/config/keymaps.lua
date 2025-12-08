-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "X", '"_X', { noremap = true, silent = true })

-- disable default mark setting
vim.keymap.set("n", "m", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "`", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "'", "<Nop>", { noremap = true, silent = true })

-- Disable the command history window (q:)
vim.keymap.set("n", "q:", ":", { noremap = true })

-- Optional: Disable other command-line window shortcuts
vim.keymap.set("n", "q/", "<nop>", { desc = "Disable search history" })
vim.keymap.set("n", "q?", "<nop>", { desc = "Disable search history" })
