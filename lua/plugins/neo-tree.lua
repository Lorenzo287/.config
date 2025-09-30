return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
		vim.keymap.set("n", "<leader>-", "<cmd>Neotree buffers reveal float<CR>", { desc = "Show Buffers in NeoTree" })

		require("neo-tree").setup({
			popup_border_style = "",
			filesystem = {
				filtered_items = {
					visible = true,
					-- Uncomment these if you don't want to see them gray
					-- hide_dotfiles = false,
					-- hide_gitignored = false,
				},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				window = {
					mappings = {
						["d"] = function(state)
							local node = state.tree:get_node()
							local path = node:get_id()

							local confirmed = vim.fn.confirm("Delete " .. node.name .. "?", "&Yes\n&No", 2)
							if confirmed ~= 1 then
								return
							end

							-- Use recycle-bin utility to move the file to the Recycle Bin
							local result = vim.fn.system({ "recycle-bin", path })
							require("neo-tree.ui.renderer").redraw(state)
						end,
					},
				},
			},
			window = {
				width = 30, -- default 40
			},
		})
	end,
}
