return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[
            set background=dark
            let g:gruvbox_material_foreground = 'material'
            let g:gruvbox_material_background = 'medium'
            let g:gruvbox_material_better_performance = 1
            let g:gruvbox_material_enable_italic = 1
            let g:gruvbox_material_inlay_hints_background = 'dimmed'
            let g:gruvbox_material_diagnostic_text_highlight = 1
            let g:gruvbox_material_diagnostic_virtual_text = "colored"
            let g:gruvbox_material_sign_column_background = 'none'

            colorscheme gruvbox-material
            ]]
    end,
  },
}
