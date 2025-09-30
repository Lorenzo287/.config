return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")

		-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
		null_ls.setup({
			border = "rounded",
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier,

				-- null_ls.builtins.diagnostics.cppcheck.with({
				-- 	extra_args = function(params)
				-- 		return {
				-- 			params.bufname,
				-- 			"--suppress=normalCheckLevelMaxBranches",
				-- 			"--inline-suppr",
				-- 			"--template=gcc",
				-- 		}
				-- 	end,
				-- }),
			},
		})
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file" })
	end,
}
