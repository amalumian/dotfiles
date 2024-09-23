return {
  'folke/zen-mode.nvim',
  config = function()
    vim.keymap.set('n', '<leader>z', function()
      require('zen-mode').setup {
        window = {
          width = 100,
          options = {},
        },
      }
      require('zen-mode').toggle()
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
      vim.wo.colorcolumn = ''
    end, { desc = 'Zed Mode' })
  end,
}
