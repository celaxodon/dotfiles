return {
	{ "flazz/vim-colorschemes" }, -- large collection of colorschemes
	{ "chriskempson/base16-vim" }, -- base16 color schemes
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "moonfly",
		},
	},
}
