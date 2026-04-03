return {
	{ "machakann/vim-sandwich" }, -- Surround sections of text
	-- TODO: Overlapping functionality with mini.comment; choose one.
	{ "tpope/vim-commentary" }, -- Comment out blocks of text
	-- TODO: Does this functionality already exist in lazyvim? Something with treesitter
	{ "tpope/vim-endwise" }, -- Fill in 'end' in Elixir/Ruby
	{ "tpope/vim-abolish" },
	{ "ntpeters/vim-better-whitespace" },
	{ "rhysd/conflict-marker.vim" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"elixir",
				"erlang",
				"heex",
				"javascript",
				"html",
				"markdown",
				"python",
				"rust",
			})
		end,
		-- build = ":TSUpdate",
		-- config = function()
		-- 	local configs = require("nvim-treesitter.configs")

		-- 	configs.setup({
		-- 		ensure_installed = {
		-- 			"c",
		-- 			"lua",
		-- 			"vim",
		-- 			"vimdoc",
		-- 			"query",
		-- 		},
		-- 		sync_install = false,
		-- 		highlight = { enable = true },
		-- 		indent = { enable = true },
		-- 	})
		-- end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
	-- {'elixir-editors/vim-elixir'},  -- Elixir indentation and syntax highlighting
	{ "rust-lang/rust.vim" }, -- Rust syntax highlighting
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	-- TODO: look into this
	-- {'mfussenegger/nvim-dap'}
	{ "edkolev/tmuxline.vim" }, -- tmux status line. Integrates with lightline/airline
	-- TODO: Figure out how to swap this with the default nvim-web-devicons plugin
	-- { "kyazdani42/nvim-web-devicons" }, -- for icons in status line. Integrates with lualine.vim
	{ "nvie/vim-flake8" }, -- PEP8 checking
}
