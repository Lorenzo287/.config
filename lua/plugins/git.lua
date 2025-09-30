return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Blame" })
		end,
	},
}
