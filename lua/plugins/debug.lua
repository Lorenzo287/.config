return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" },
			handlers = {},
		})

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
