return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  cmd = {
    "SupermavenUseFree",
    "SupermavenUsePro",
  },
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
    color = {
      suggestion_color = "#ffffff",
      cterm = 244,
    },
    log_level = "off",
    disable_inline_completion = false,
    disable_keymaps = false,
    condition = function()
      return false
    end,
  },
}
