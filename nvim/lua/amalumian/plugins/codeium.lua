return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = 'Codeium',
  event = 'BufEnter',
  build = ':Codeium Auth',
  opts = {
    enable_cmp_source = false,
    virtual_text = {
      enabled = true,
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
