return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {
		transparent_background = true,
	} },
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
