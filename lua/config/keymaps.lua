-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--- esc на jj
map("i", "jj", "<ESC>", opts)

--- отключение стрелочек (только hjkl)
map("", "<up>", "", opts)
map("", "<down>", "", opts)
map("", "<left>", "", opts)
map("", "<right>", "", opts)
