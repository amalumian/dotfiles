return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.animate').setup {
      scroll = {
        enable = false,
      },
    }
    require('mini.starter').setup()
  end,
}
