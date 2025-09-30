return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 9,
			},
		})
		vim.keymap.set("n", "<leader>b", oil.toggle_float, { desc = "Toggle Oil" })
		vim.keymap.set("n", "<leader>o", oil.open, { desc = "Open Oil" })
	end,
}
