return {
	{
		"windwp/nvim-ts-autotag",
		opts = function(_, opts)
			print(vim.inspect(opts))
			table.insert(opts, {
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
					filetypes = {
						"html",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"svelte",
						"vue",
						"tsx",
						"jsx",
						"rescript",
						"xml",
						"php",
						"astro",
						"glimmer",
						"handlebars",
						"hbs",
					},
				},
			})
		end,
	},
}
