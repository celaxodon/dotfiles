-- Stopgap for nvim-treesitter (master, archived) on Neovim 0.12+, where
-- directive/predicate callbacks receive `match[capture_id]` as a TSNode[]
-- rather than a single TSNode. The plugin's `all = false` shim no longer
-- compensates, so calls like `node:range()` blow up with
-- "attempt to call method 'range' (a nil value)" on markdown injections.
-- Remove once LazyVim ships a `main`-compatible nvim-treesitter spec.

local query = require("vim.treesitter.query")

local function first_node(match, id)
	local v = match[id]
	if type(v) == "table" then
		return v[1]
	end
	return v
end

local html_script_type_languages = {
	["importmap"] = "json",
	["module"] = "javascript",
	["application/ecmascript"] = "javascript",
	["text/ecmascript"] = "javascript",
}

local non_filetype_match_injection_language_aliases = {
	ex = "elixir",
	pl = "perl",
	sh = "bash",
	uxn = "uxntal",
	ts = "typescript",
}

local function get_parser_from_markdown_info_string(injection_alias)
	local m = vim.filetype.match({ filename = "a." .. injection_alias })
	return m or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
end

local opts = { force = true, all = true }

query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
	local node = first_node(match, pred[2])
	if not node then
		return
	end
	local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
	local configured = html_script_type_languages[type_attr_value]
	if configured then
		metadata["injection.language"] = configured
	else
		local parts = vim.split(type_attr_value, "/", {})
		metadata["injection.language"] = parts[#parts]
	end
end, opts)

query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
	local node = first_node(match, pred[2])
	if not node then
		return
	end
	local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
	metadata["injection.language"] = get_parser_from_markdown_info_string(injection_alias)
end, opts)

query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
	local id = pred[2]
	local node = first_node(match, id)
	if not node then
		return
	end
	local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
	if not metadata[id] then
		metadata[id] = {}
	end
	metadata[id].text = string.lower(text)
end, opts)

query.add_predicate("nth?", function(match, _pattern, _bufnr, pred)
	local node = first_node(match, pred[2])
	local n = tonumber(pred[3])
	if node and node:parent() and node:parent():named_child_count() > n then
		return node:parent():named_child(n) == node
	end
	return false
end, opts)

query.add_predicate("is?", function(match, _pattern, bufnr, pred)
	local locals = require("nvim-treesitter.locals")
	local node = first_node(match, pred[2])
	local types = { unpack(pred, 3) }
	if not node then
		return true
	end
	local _, _, kind = locals.find_definition(node, bufnr)
	return vim.tbl_contains(types, kind)
end, opts)

query.add_predicate("kind-eq?", function(match, _pattern, _bufnr, pred)
	local node = first_node(match, pred[2])
	local types = { unpack(pred, 3) }
	if not node then
		return true
	end
	return vim.tbl_contains(types, node:type())
end, opts)
