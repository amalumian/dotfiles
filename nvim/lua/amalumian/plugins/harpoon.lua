return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        '<C-e>',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Toggle Quick Menu',
      },
      {
        '<C-h>',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Harpoon Select 1',
      },
      {
        '<C-j>',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Harpoon Select 2',
      },
      {
        '<C-k>',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Harpoon Select 3',
      },
      {
        '<C-l>',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Harpoon Select 4',
      },
      {
        '<leader><C-h>',
        function()
          require('harpoon'):list():replace_at(1)
        end,
        desc = 'Harpoon Replace 1',
      },
      {
        '<leader><C-j>',
        function()
          require('harpoon'):list():replace_at(2)
        end,
        desc = 'Harpoon Replace 2',
      },
      {
        '<leader><C-k>',
        function()
          require('harpoon'):list():replace_at(3)
        end,
        desc = 'Harpoon Replace 3',
      },
      {
        '<leader><C-l>',
        function()
          require('harpoon'):list():replace_at(4)
        end,
        desc = 'Harpoon Replace 4',
      },
    }

    return keys
  end,
}
