local function create_floating_window(content, ft, opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.7)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].buftype = "nofile"

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, content or {})

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		border = "rounded",
	}
	vim.api.nvim_open_win(buf, true, win_config)

	if ft then
		vim.bo[buf].filetype = ft
	end

	vim.bo[buf].modifiable = false
	vim.bo[buf].swapfile = false
end

local function run_cheat(query)
	local cheat_query = ""
	local ft = nil

	if not query or query == "" then
		cheat_query = "" -- cheat.sh homepage
	else
		local parts = vim.split(query, "%s+", { trimempty = true })

		local lang = parts[1]
		if lang and not lang:match("^:") and vim.treesitter.language.get_lang(lang) then
			ft = lang
			table.remove(parts, 1)
		end

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
			if cheat_query == "" then
				cheat_query = ft
			else
				cheat_query = ft .. "/" .. cheat_query
			end
		end
	end

	vim.fn.jobstart({ "curl", "-s", "cheat.sh/" .. cheat_query .. "?T" }, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data and not (#data == 1 and data[1] == "") then
				create_floating_window(data, ft)
			end
		end,
		on_stderr = function(_, data)
			if data and data[1] ~= "" then
				create_floating_window({ "Error running curl:", table.concat(data, "\n") }, "text")
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
