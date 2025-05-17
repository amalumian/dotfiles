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
        '<leader>a',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon File',
      },
      {
        '<C-e>',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
      },
      {
        '<C-h>',
        function()
          require('harpoon'):list():select(1)
        end,
      },
      {
        '<C-j>',
        function()
          require('harpoon'):list():select(2)
        end,
      },
      {
        '<C-k>',
        function()
          require('harpoon'):list():select(3)
        end,
      },
      {
        '<C-l>',
        function()
          require('harpoon'):list():select(4)
        end,
      },
      {
        '<leader><C-h>',
        function()
          require('harpoon'):list():replace_at(1)
        end,
      },
      {
        '<leader><C-j>',
        function()
          require('harpoon'):list():replace_at(2)
        end,
      },
      {
        '<leader><C-k>',
        function()
          require('harpoon'):list():replace_at(3)
        end,
      },
      {
        '<leader><C-l>',
        function()
          require('harpoon'):list():replace_at(4)
        end,
      },
    }

    return keys
  end,
}
