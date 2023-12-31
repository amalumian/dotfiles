return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        virtual_text = false,
        float = {
          border = "rounded",
        },
      },
      servers = {
        kotlin_language_server = {},
        lemminx = {},
        ltex = {
          settings = {
            ltex = {
              language = "ru-RU",
            },
          },
        },
      },
    },
  },
}
