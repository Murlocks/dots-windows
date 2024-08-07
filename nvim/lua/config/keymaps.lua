-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Mode Navigation
map({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
map({ "i" }, "jk", "<esc>", { desc = "Enter normal mode" })

-- Buffer Navigation
map("n", "<tab>", ":bnext<CR>", { desc = "Next tab" })
map("n", "<s-tab>", ":bprev<CR>", { desc = "Previous tab" })

-- Line Navigation
map("n", "H", "^", { desc = "Start of line" })
map("n", "L", "$", { desc = "End of line" })
