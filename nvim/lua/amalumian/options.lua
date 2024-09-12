vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.mouse = ''
vim.opt.guicursor = ''
vim.opt.path:append { '**' }
vim.opt.termguicolors = true
vim.opt.splitkeep = 'cursor'
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.shell = 'zsh'
vim.opt.expandtab = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.colorcolumn = "100"
