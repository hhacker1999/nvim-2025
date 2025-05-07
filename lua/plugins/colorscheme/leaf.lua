return {
	"daschw/leaf.nvim",
	priority = 1000,
	config = true,
	init = function()
		-- Default options
		require("leaf").setup({
			underlineStyle = "underline",
			commentStyle = "italic",
			functionStyle = "NONE",
			keywordStyle = "italic",
			statementStyle = "bold",
			typeStyle = "NONE",
			variablebuiltinStyle = "italic",
			transparent = true,
			colors = {},
			overrides = {
				NormalFloat = {
					bg = "none",
				},
				FloatBorder = {
					bg = "none",
				},
				FoldColumn = {
					bg = "none",
				},
			},
			theme = "dark", -- default, based on vim.o.background, alternatives: "light", "dark"
			contrast = "high", -- default, alternatives: "medium", "high"
		})
	end,
}
