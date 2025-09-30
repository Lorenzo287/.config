return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		opts = {
			ensure_installed = { "lua_ls", "clangd", "pyright", "ts_ls", "tinymist" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "LSP References" })
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
			vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "LSP Rename" })
			vim.keymap.set("n", "<leader>ll", function()
				if vim.diagnostic.is_enabled() then
					vim.diagnostic.disable()
					print("Diagnostics disabled")
				else
					vim.diagnostic.enable()
					print("Diagnostics enabled")
				end
			end, { desc = "LSP Toggle Diagnostics" })
		end,
	},
}
