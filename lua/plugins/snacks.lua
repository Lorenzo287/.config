return {
	{
		-- TODO:
		-- FIX:
		-- NOTE:
		-- WARN:
		-- HACK:
		-- PERF:
		-- TEST:
		-- COOL:
		"folke/todo-comments.nvim",
		opts = {
			keywords = {
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "󰓅 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				COOL = { icon = " ", color = "error", alt = { "FIGO", "FIGATA" } },
				-- can use HEX for color eg #348d72, but won't folow theme
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			indent = { enabled = false },
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = false },
			words = { enabled = false }, -- highliht multiple word occurences
		},
	},
}
