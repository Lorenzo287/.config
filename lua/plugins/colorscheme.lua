return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			-- pcall(vim.cmd.colorscheme, "default")
			pcall(vim.cmd.colorscheme, "kanagawa-wave")

			local themes = {
				"kanagawa-dragon",
				"gruvbox",
				"tokyonight",
				"catppuccin",
				"onedark",
				"onedark_vivid",
				"dracula",
				"rose-pine",
				"cyberdream",
				"vscode",
				"evergarden",
				"solarized-osaka",
				"kanagawa-wave",
			}

			local current = 0
			local function apply(idx)
				local theme = themes[idx]
				if theme == "cyberdream" then
					require("cyberdream").setup({
						variant = "default",
						transparent = true,
					})
				end
				if theme == "rose-pine" then
					require("rose-pine").setup({
						palette = {
							main = {
								pine = "#3e93b5", -- #46a7cd
							},
						},
						styles = {
							bold = true,
							italic = false,
							transparency = false,
						},
					})
				end
				if theme == "onedark" then
					require("onedark").setup({
						style = "warmer",
						colors = {
							grey = "#7e8084",
						},
					})
				end
				if theme == "solarized-osaka" then
					require("solarized-osaka").setup({
						transparent = false,
					})
				end

				local ok, err = pcall(vim.cmd.colorscheme, themes[idx])
				if ok then
					vim.notify("Colorscheme: " .. themes[idx], vim.log.levels.INFO)
				else
					vim.notify(
						"Failed to load colorscheme: " .. themes[idx] .. "\n" .. tostring(err),
						vim.log.levels.WARN
					)
				end
			end

			vim.keymap.set("n", "<F8>", function()
				current = (current % #themes) + 1
				apply(current)
			end, { desc = "Next colorscheme" })
		end,
	},

	-- { "rebelot/kanagawa.nvim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{ "mofiqul/dracula.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
	{ "scottmckendry/cyberdream.nvim", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = true },
	{ "olimorris/onedarkpro.nvim", lazy = true },
	{ "everviolet/nvim", name = "evergarden", lazy = true },
	{ "craftzdog/solarized-osaka.nvim", lazy = true },

	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				names = false,
			},
		},
	},
}
