return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      exclude = {
        ".DS_Store",
        ".git",
        "node_modules",
        "package-lock.json",
        "yarn.lock",
      },
      sources = {
        files = { ignored = true, hidden = true },
        explorer = { exclude = { ".DS_Store" }, ignored = true, hidden = true },
        grep = { ignored = true, hidden = true },
        grep_word = { ignored = true, hidden = true },
        grep_buffers = { ignored = true, hidden = true },
      },
    },
  },
}
