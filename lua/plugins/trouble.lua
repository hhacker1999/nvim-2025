local M = {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {},
	keys = {
		{
			"<leader>ad",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}

return M
