return {
	{
		"nvim-mini/mini.pairs",
		config = function()
			require("mini.pairs").setup({
				mappings = {
					["("] = false,
					[")"] = false,
					["["] = false,
					["]"] = false,
					['"'] = false,
					["'"] = false,
				},
			})
		end,
	},
	{
		"nvim-mini/mini.comment",
		config = function()
			require("mini.comment").setup()
		end,
	},
	-- {
	-- 	"nvim-mini/mini.icons",
	-- 	config = function()
	-- 		require("mini.icons").setup()
	-- 	end,
	-- },
}
