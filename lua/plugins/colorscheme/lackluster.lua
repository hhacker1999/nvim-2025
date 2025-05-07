return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		--  When testing transparent backgrounds I found that comments where often hard to read,
		--  and menus didn't look good but using setup() tweaks you can easily address that!
		local lackluster = require("lackluster")

		-- !must called setup() before setting the colorscheme!
		lackluster.setup({
			tweak_syntax = {
				comment = lackluster.color.green,
			},
			tweak_background = {
				normal = "none",
				telescope = "none",
				menu = lackluster.color.gray3,
				popup = "none",
			},
		})
	end,
}
