-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Mode Navigation
map({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
map({ "i" }, "jk", "<esc>", { desc = "Enter normal mode" })

-- Buffer Navigation (bufferline dependency)
-- map("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
-- map("n", "<s-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Line Navigation
-- map("n", "H", "^", { desc = "Start of line" })
-- map("n", "L", "$", { desc = "End of line" })

-- QOL
map("n", "*", "*`'", { desc = "'*' but keep cursor place", silent = true })
map("n", "#", "#`'", { desc = "'#' but keep cursor place", silent = true })
map("n", "go", "m'o<esc>`'", { desc = "New line below cursor", silent = true })
map("n", "gO", "m'O<esc>`'", { desc = "New line above cursor", silent = true })
