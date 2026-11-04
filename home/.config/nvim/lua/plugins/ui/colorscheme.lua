return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
      },
      integrations = {
        lualine = {
          all = function(colors)
            return {
              normal = {
                c = { bg = colors.mantle },
              },
              inactive = {
                a = { bg = colors.mantle },
                b = { bg = colors.mantle },
                c = { bg = colors.mantle },
              },
            }
          end,
        },
        gitsigns = {
          enabled = true,
          transparent = false,
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
