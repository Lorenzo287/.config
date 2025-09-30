return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		vim.opt.laststatus = 3 -- enables global statusline
		require("lualine").setup({
			options = {
				disabled_filetypes = { statusline = { "alpha" } },
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
			},
		})
	end,
}
