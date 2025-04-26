return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  cmd = 'Codeium',
  event = 'InsertEnter',
  build = ':Codeium Auth',
  opts = {
    enable_cmp_source = false,
    virtual_text = {
      enabled = true,
      idle_delay = 25,
      key_bindings = {
        accept = '<Tab>',
        accept_word = false,
        accept_line = '<C-]>',
        next = '<M-]>',
        prev = '<M-[>',
      },
    },
  },
}
