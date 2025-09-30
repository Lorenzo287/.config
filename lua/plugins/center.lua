return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		require("no-neck-pain").setup({
			width = 80,
			buffers = {
				-- scratchPad = {
				-- 	enabled = true, -- autosaving
				-- 	location = nil, -- current working dir
				-- },
				-- bo = {
				-- 	filetype = "md",
				-- },
				wo = {
					fillchars = "eob: ",
				},
				right = {
					enabled = false,
				},
			},
		})
		vim.keymap.set("n", "<leader>z", "<cmd>NoNeckPain<CR>", { desc = "Toggle No Neck Pain" })
	end,
}
