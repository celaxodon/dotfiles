vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
-- Paste with middle mouse button
vim.opt.mouse = "v"
-- CVE-2007-2438
vim.opt.modelines = 0
vim.opt.clipboard = "unnamedplus"

-- require("lazy").setup({import = 'user.plugins'})
require("config.lazy")

------------
--- UI
------------

-- Use the filename for window title
vim.opt.title = true
-- Use line numbers by default
vim.opt.number = true
-- set spellcheck on
-- vim.opt.spell = true
vim.opt.spell.spelllang = "en_us"

-- Have a vertical buffer around the cursor when scrolling
vim.opt.scrolloff = 2
-- Turn off insert comment below status bar -- it's part of the current status bar setup
vim.opt.showmode = false
-- set width of non-ascii chars
vim.opt.ambiwidth = "single"

-----------------
--- Code Folding
-----------------
-- TODO: Is this still necessary with lazyvim?
-- Don't fold by default
vim.opt.foldenable = false
-- Name current fold method
vim.opt.foldmethod = "indent"
-- Max nesting for "indent" and "syntax" folding
vim.opt.foldnestmax = 2
-- Higher means more folds open; 0 means all folds closed
vim.opt.foldlevel = 10
vim.opt.foldlevelstart = 1

-----------------
--- Tab Behavior
-----------------
-- set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- enter spaces when tab is pressed
vim.opt.expandtab = true
-- Indent to a multiple of 'shiftwidth'
vim.opt.shiftround = true

-----------------------
--- CoC Configurations
-----------------------

-- Some servers have issues with backup files, see #649
vim.opt.backup = false

-- Give more space for displaying messages
vim.opt.cmdheight = 2

--  Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append("c")
-- Always show the sign column, otherwise it would shift the text each time diagnostics
-- appear or become resolved
vim.opt.signcolumn = "number"

-- vim.cmd "source ~/.config/nvim/vim/coc.vim"

vim.opt.wildignore:append({ "*/.git/*", "*/tmp/*", "*.swp", "*.swo", "*.pyc" })

-- TODO: Highlight group for trailing whitespace (but only at ends of lines with text):
-- :highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen

--------------------
--- Search behavior
--------------------

-- automatically show matching brackets
vim.opt.showmatch = true
-- use case-sensitivity when you search w/ upper-case chars
vim.opt.smartcase = true
-- Ignore case when searchign for text
vim.opt.ignorecase = true

--------------
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
vim.api.nvim_set_keymap("i", "<leader>c", "<c-v>u2713<esc>:w<cr>", { noremap = true })

-- Test runners
vim.keymap.set({ "n", "v", "o" }, "<leader>t", function()
	single_test_runner()
end, { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "<leader>T", function()
	multi_test_runner()
end, { noremap = true })

-- TODO: \w keymap to highlight whitespace; \W keymap to trim whitespace
-- map <leader>w /\s\+$<cr>
--
-- Flag bad trailing whitespace
-- "au BufNewFile,BufRead *.py,*.pyw,*.c,*.h,*.rs
-- "    \ match BadWhitespace /\S\zs\s\+$
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"},
--                             {pattern = {"*.py", "*.c", "*.ex", "*.exs", "*.rs", "*.yml", "*.yaml"},
--                              command = "match BadWhitespace /\\S\\zs\\s\\+$"})

-- Set pastetoggle with <F3> key. No smart indenting, just pastes as normal.
-- vim.g.pastetoggle = "<F3>"
