return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"lewis6991/gitsigns.nvim",
		"nvim-telescope/telescope.nvim",
	},
	init = function()
		require("neogit").setup({})
		local gitsigns = require("gitsigns")
		gitsigns.setup()
		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, nil)
		vim.keymap.set("n", "<leader>ph", gitsigns.preview_hunk, nil)
	end,
}

