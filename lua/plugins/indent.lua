-- local highlight = {
-- 	"CursorColumn",
-- 	"Whitespace",
-- }
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "│" },

		-- indent = { highlight = highlight, char = "" },
		-- whitespace = {
		-- 	highlight = highlight,
		-- 	remove_blankline_trail = false,
		-- },
		scope = { enabled = false },
	},
}
