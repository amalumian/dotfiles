return {
  'rose-pine/neovim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  name = 'rose-pine',
  opts = {
    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },
  },
  init = function()
    vim.cmd.colorscheme 'rose-pine'
    vim.cmd.hi 'Comment gui=none'
  end,
}
