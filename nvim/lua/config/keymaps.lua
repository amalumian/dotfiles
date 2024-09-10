local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete text into a black hole
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Global word replacement under the cursor
keymap.set(
	"n",
	"<Leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Global Word Replacement" }
)

-- Restart Vim config
vim.keymap.set("n", "<leader>R", function()
	vim.cmd("so")
end, { desc = "Restart Vim" })

-- Cursor stays in the middle during jumps
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Do the same as previous but for searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Move selected lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Diagnostics
keymap.set("n", "<C-;>", function()
	vim.diagnostic.goto_next()
end, opts)
