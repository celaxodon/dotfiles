-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable nvm-cmp and nvim-ts-autotag plugins for markdown and text files",
	pattern = { "markdown", "text" },
	callback = function()
		-- require("blink-cmp").setup({ enabled = false })
		require("nvim-ts-autotag").setup({ enabled = false })
		-- require("nvim-treesitter.configs").setup({
		-- 	ensure_installed = "maintained", -- or a list of languages you want to ensure are installed
		-- 	sync_install = false,
		-- 	auto_install = true,
		-- 	ignore_install = {}, -- list of parsers to ignore installing
		-- 	highlight = {
		-- 		enable = true,
		-- 	},
		-- 	autotag = {
		-- 		enable = false, -- disable autotag for markdown and text files
		-- 	},
		-- 	modules = {}, -- required
		-- })
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	desc = "Set tabstop and other settings for Python files",
	pattern = "python",
	command = "set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=100 expandtab autoindent fileformat=unix",
})

vim.api.nvim_create_autocmd({ "BufNew", "BufNewFile", "BufEnter" }, {
	desc = "C-style indentation, according to the C indentation standard",
	pattern = { "*.c" },
	command = "set cindent",
})

vim.api.nvim_create_autocmd({ "BufNew", "BufNewFile", "BufRead" }, {
	desc = "Makefile tab behavior",
	pattern = { "*.mk", "Config.in" },
	command = "set tabstop=8 shiftwidth=0 noexpandtab",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	desc = "Tab behavior for JS/HTML/CSS/XML/YML files",
	pattern = { "*.html", "*.css", "*.js", "*.json", "*.xml", "*.yml", "*.yaml" },
	command = "set tabstop=2 softtabstop=2 shiftwidth=2",
})
