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
	-- {
	-- 	"hrsh7th/cmp-nvim-lsp",
	-- },
	-- -- {
	-- -- 	"L3MON4D3/LuaSnip",
	-- -- 	dependencies = {
	-- -- 		"saadparwaiz1/cmp_luasnip",
	-- -- 		"rafamadriz/friendly-snippets",
	-- -- 	},
	-- -- },
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		-- require("luasnip.loaders.from_vscode").lazy_load()
	--
	-- 		cmp.setup({
	-- 			-- snippet = {
	-- 			-- 	expand = function(args)
	-- 			-- 		require("luasnip").lsp_expand(args.body)
	-- 			-- 	end,
	-- 			-- },
	-- 			window = {
	-- 				completion = cmp.config.window.bordered(),
	-- 				documentation = cmp.config.window.bordered(),
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete(),
	-- 				["<C-e>"] = cmp.mapping.abort(),
	-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
	-- 			}),
	-- 			sources = cmp.config.sources({
	-- 				{ name = "nvim_lsp" },
	-- 				-- { name = "luasnip" },
	-- 			}, {
	-- 				{ name = "buffer" },
	-- 			}),
	-- 		})
	-- 	end,
	-- },
}
