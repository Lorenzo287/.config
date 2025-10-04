return {
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			vim.cmd("Copilot disable")
			local copilot_enabled = false

			vim.keymap.set("n", "<leader>c", function()
				if copilot_enabled then
					vim.cmd("Copilot disable")
					copilot_enabled = false
					print("Copilot disabled")
				else
					vim.cmd("Copilot enable")
					copilot_enabled = true
					print("Copilot enabled")
				end
			end, { noremap = true, silent = true, desc = "Toggle Copilot" })
		end,
	},
	{

		"saghen/blink.cmp",
		event = "VeryLazy",
		-- dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			keymap = {
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono", -- or "normal"
			},
			sources = {
				default = { "lsp", "path", "buffer" }, -- "snippets"
			},
			signature = { enabled = true },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
}
