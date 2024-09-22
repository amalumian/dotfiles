return {
  -- {
  --   'projekt0n/github-nvim-theme',
  --   priority = 1000,
  --   config = function()
  --     require('github-theme').setup {
  --       options = {
  --         transparent = true,
  --       },
  --     }
  --
  --     vim.cmd 'colorscheme github_light_default'
  --   end,
  -- },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent_background = true,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin-latte'
    end,
  },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   opts = {
  --     style = 'night',
  --     transparent = true,
  --     styles = {
  --       sidebars = 'transparent',
  --       floats = 'transparent',
  --     },
  --   },
  --   init = function()
  --     vim.cmd.colorscheme 'tokyonight'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
  -- {
  --   'rose-pine/neovim',
  --   priority = 1000,
  --   name = 'rose-pine',
  --   opts = {
  --     styles = {
  --       bold = true,
  --       italic = true,
  --       transparency = true,
  --     },
  --   },
  --   init = function()
  --     vim.cmd.colorscheme 'rose-pine'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
}
