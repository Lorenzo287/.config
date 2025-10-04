vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

-- vim.cmd([[set mouse=]])
vim.opt.winborder = "rounded"
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.cursorcolumn = false
vim.o.cursorline = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 10
vim.opt.confirm = true

-- "za" to fold
vim.wo.foldenable = true
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99
vim.wo.foldcolumn = "0"

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.keymap.set("n", "<leader>x", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>wqa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>v", "<cmd>e $MYVIMRC<CR>", { desc = "Edit config" })
-- vim.keymap.set({ "n", "v" }, "<leader>o", ":update<CR> :source<CR>", { desc = "Save and source file" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

require("config.lazy")
require("terminal")
require("cheat-sh")

vim.keymap.set(
	"n",
	"<leader>m",
	"i#include <stdio.h><CR><CR>int main(void) {<CR>return 0;<CR>}<Esc>kO",
	{ noremap = true, silent = true, desc = "Insert main()" }
)

vim.keymap.set("n", "<leader>s", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.opt.spell:get() then
		vim.opt.spell = false
		print("Spell check OFF")
	else
		vim.opt.spell = true
		vim.opt.spelllang = { "en" }
		print("Spell check ON")
	end
end, { desc = "Toggle spell check" })
-- ]s  Jump to next misspelled word
-- [s  Jump to previous misspelled word
-- z=  Show spelling suggestions
-- zg  Mark word as good (add to dictionary)
-- zw  Mark word as wrong
-- zug Undo 'good' word (remove from dictionary)
