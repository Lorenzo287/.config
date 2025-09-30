return {
	{
		"CRAG666/code_runner.nvim",
		event = "VeryLazy",
		config = function()
			require("code_runner").setup({
				mode = "float",
				float = { border = "rounded" },
				filetype = {},
			})
			vim.keymap.set("n", "<leader>r", "<cmd>RunCode<CR>", { desc = "Run code" })
		end,
	},
	{
		"CRAG666/betterTerm.nvim",
		event = "VeryLazy",
	},
}
