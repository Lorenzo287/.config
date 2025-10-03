local function create_floating_window(content, ft, opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.7)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].swapfile = false

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, content or {})
	if ft then
		vim.bo[buf].filetype = ft
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		border = "rounded",
		-- style = "minimal",
	}
	vim.api.nvim_open_win(buf, true, win_config)

	vim.bo[buf].modifiable = false
end

local function parse_query(query)
	if not query or query == "" then
		return "", nil
	end

	if query:match("/") then
		local lang = query:match("^([^/]+)/")
		local ft = lang and vim.treesitter.language.get_lang(lang) and lang or nil
		return query, ft
	end

	local parts = vim.split(query, "%s+", { trimempty = true })
	if #parts == 0 then
		return "", nil
	end

	local lang = parts[1]
	local ft = nil

	if lang and not lang:match("^:") and vim.treesitter.language.get_lang(lang) then
		ft = lang
		table.remove(parts, 1)
	end

	local cheat_query = ""

	if #parts > 0 then
		local last = parts[#parts]
		if last:match("^:") then
			if #parts > 1 then
				local question = table.concat(vim.list_slice(parts, 1, #parts - 1), "+")
				cheat_query = question .. "/" .. last
			else
				cheat_query = last
			end
		else
			cheat_query = table.concat(parts, "+")
		end
	end

	if ft then
		cheat_query = cheat_query == "" and ft or (ft .. "/" .. cheat_query)
	end

	return cheat_query, ft
end

local function run_cheat(query)
	local cheat_query, ft = parse_query(query)
	local url = "cheat.sh/" .. cheat_query .. "?T"

	-- print("Fetching: " .. url)

	vim.fn.jobstart({ "curl", "-s", url }, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data and not (#data == 1 and data[1] == "") then
				create_floating_window(data, ft)
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 and data[1] ~= "" then
				create_floating_window({ "Error: " .. table.concat(data, "\n") }, "text")
			end
		end,
	})
end

local function cheat_prompt()
	vim.ui.input({ prompt = "cheat.sh: " }, function(input)
		if input then
			run_cheat(input)
		end
	end)
end

vim.api.nvim_create_user_command("Cheat", function(opts)
	run_cheat(opts.args)
end, {
	nargs = "*",
	desc = "Search cheat.sh",
})

vim.keymap.set("n", "<leader>e", cheat_prompt, { desc = "Search cheat.sh" })
