-- Stay in the middle during jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Stay in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without yanking
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "Paste (BH)" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>D", [["_d]], { desc = "Delete (BH)" })
