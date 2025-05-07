local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<C-tab>", "<c-6>", opts)

-- Move lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "<leader>n", "<cmd>nohlsearch<cr>", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Save all buffers
keymap("n", "<leader>w", function()
  vim.cmd [[:wa]]
  print "Saved"
end, opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Toggle truncate lines
keymap('n', '<leader>lt', ':set wrap!<cr>', opts)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
