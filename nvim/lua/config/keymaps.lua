-- Toggle oil.nvim
vim.keymap.set('n', '<leader>e', function()
  if vim.bo.filetype == 'oil' then
    vim.cmd 'b#'
  else
    vim.cmd 'Oil'
  end
end, { desc = '[E]explorer Oil' })

-- Cursor stays in the middle during jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Cursor stays in the middle while searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move selected lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Delete without yanking
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Delete text into a black hole
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[Q]uery [L]ocation List' })

-- Open float diagnostic
vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = '[V]iew [D]iagnostics' })

-- theprimeagen's keymap
vim.keymap.set('n', '<C-p>', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
