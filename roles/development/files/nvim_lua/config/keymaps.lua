-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- --------------
--- Functions
--------------

local function write_buf_if_modified()
	local current_buf = vim.api.nvim_get_current_buf()
	if vim.api.nvim_get_option_value("modified", { buf = current_buf }) then
		vim.api.nvim_buf_call(current_buf, function()
			vim.cmd("silent! write")
		end)
	end
end

local function single_test_runner()
	local in_test_file =
		vim.fn.match(vim.fn.expand("%"), "\\(test_.*\\.py\\|.*_test\\.py\\|.*_test\\.exs\\|test_.*\\.exs\\|.*\\.rs\\)$")

	if in_test_file ~= -1 then
		write_buf_if_modified()
		-- %:e -- just the suffix, no punctuation
		-- %:p -- full path
		-- %:t -- filename + suffix
		local suffix = vim.fn.expand("%:e")
		if suffix == "py" then
			if vim.fn.filereadable("./pyproject.toml") then
				vim.cmd("! poetry run pytest %")
			else
				vim.cmd("! pytest %")
			end
		elseif suffix == "exs" then
			vim.cmd("! mix test")
		elseif suffix == "rs" then
			-- Just run all tests with the same keybind - haven't encountered a situation
			-- where they were too slow that this was an issue yet.
			vim.cmd("! cargo test")
		else
			print("No test runner defined for this file type")
		end
	else
		print("Can't run the single test runner on this file")
	end
end

local function multi_test_runner()
	-- Check if in a test file, if not, exit
	local in_applicable_file = vim.fn.match(vim.fn.expand("%"), "\\(.*\\.py\\|.*\\.exs\\|.*\\.ex\\|.*\\.rs\\)$")

	if in_applicable_file ~= -1 then
		write_buf_if_modified()
		local suffix = vim.fn.expand("%:e")
		if suffix == "py" then
			if vim.fn.filereadable("./pyproject.toml") then
				vim.cmd("! poetry run pytest tests")
			else
				vim.cmd("! pytest tests")
			end
		elseif suffix == "exs" or suffix == "ex" then
			vim.cmd("! mix test")
		elseif suffix == "rs" then
			-- Just run all tests with the same keybind - haven't encountered a situation
			-- where they were too slow that this was an issue yet.
			vim.cmd("! cargo test")
		else
			print("No test runner defined for this file type")
		end
	else
		print("Can't run the single test runner on this file")
	end
end

-------------
--- Mappings
-------------

-- Unicode ✓ mark
vim.keymap.set({ "i" }, "<leader>c", "<c-v>u2713<esc>:w<cr>", { noremap = true })

-- Test runners
vim.keymap.set({ "n", "v", "o" }, "<leader>t", function()
	single_test_runner()
end, { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<leader>T", function()
	multi_test_runner()
end, { noremap = true })

vim.keymap.set({ "n", "v", "o" }, "<leader>w", function()
	vim.cmd("ToggleWhitespace")
end)
vim.keymap.set({ "n", "v", "o" }, "<leader>W", function()
	vim.cmd("StripWhitespace")
end)
