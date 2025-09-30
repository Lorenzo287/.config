return {
	"jiaoshijie/undotree",
	opts = {
		float_diff = true, -- true disables layout
		layout = "left_bottom", -- "left_bottom", "left_left_bottom"
		position = "left", -- "right", "bottom"
		window = {
			winblend = 0,
		},
		keymaps = {
			j = "move_next",
			k = "move_prev",
			gj = "move2parent",
			J = "move_change_next",
			K = "move_change_prev",
			["<cr>"] = "action_enter",
			p = "enter_diffbuf",
			q = "quit",
		},
	},
	keys = {
		{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle Undotree" },
	},
}
