return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ['<C-h>'] = false,
      ['<C-l>'] = false,
      ['<C-k>'] = false,
      ['<C-j>'] = false,
      ['<M-\\>'] = 'actions.select_split',
    },
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
}
