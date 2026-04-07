-- Window, buffer, and tab management shortcuts.
-- Focus windows
vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "Focus left window",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "Focus below window",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "Focus above window",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "Focus right window",
  noremap = true,
  silent = true
})

-- Move windows to new positions
vim.keymap.set("n", "<S-Left>", "<C-w>H", {
  desc = "Move window to left",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<S-Down>", "<C-w>J", {
  desc = "Move window below",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<S-Up>", "<C-w>K", {
  desc = "Move window above",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<S-Right>", "<C-w>L", {
  desc = "Move window to right",
  noremap = true,
  silent = true
})

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", {
  desc = "Increase height",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", {
  desc = "Decrease height",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", {
  desc = "Decrease width",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", {
  desc = "Increase width",
  noremap = true,
  silent = true
})

-- Split shortcuts
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", {
  desc = "Split window below",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", {
  desc = "Split window right",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>", {
  desc = "Close window",
  noremap = true,
  silent = true
})

-- Equalize window sizes
vim.keymap.set("n", "<leader>we", "<cmd>wincmd =<cr>", {
  desc = "Equalize window sizes",
  noremap = true,
  silent = true
})

-- Jump to last accessed window
vim.keymap.set("n", "<leader>wp", "<C-w>p", {
  desc = "Jump to last window",
  noremap = true,
  silent = true
})

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", {
  desc = "Previous buffer",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", {
  desc = "Next buffer",
  noremap = true,
  silent = true
})
vim.keymap.set("n", "<leader>bb", "<cmd>buffer #<cr>", {
  desc = "Switch to alternate buffer",
  noremap = true,
  silent = true
})

-- Maximize current window (toggle)
vim.keymap.set("n", "<leader>wm", "<cmd>wincmd |<cr><cmd>wincmd _<cr>", {
  desc = "Maximize window",
  noremap = true,
  silent = true
})

-- Force write and quit
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", {
  desc = "Save and quit",
  noremap = true,
  silent = true
})
