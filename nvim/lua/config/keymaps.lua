-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
map({ "i" }, "jk", "<esc>", { desc = "Enter normal mode" })

-- map("n", "<tab>", ":bnext<CR>", { desc = "Next tab" })
-- map("n", "<s-tab>", ":bprev<CR>", { desc = "Previous tab" })
