return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
				jsonls = {},
				elixirls = {
					command = "~/bin/elixir-ls/language_server.sh",
					filetypes = { "elixir", "eelixir", "heex" },
				},
			},
		},
	},
}
