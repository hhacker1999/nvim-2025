require("options")
require("keymaps")
require("autocmd")

local spec = require("launch")
spec.insert("plugins.colorscheme")
spec.insert("plugins.lsp.mason")
spec.insert("plugins.lsp.lspconfig")
spec.insert("plugins.telescope")
spec.insert("plugins.conform")
spec.insert("plugins.oil")
spec.insert("plugins.treesitter")
spec.insert("plugins.cmp")
spec.insert("plugins.flash")
spec.insert("plugins.lualine")
spec.insert("plugins.undotree")
spec.insert("plugins.tmux_navigator")
spec.insert("plugins.bufdelete")
spec.insert("plugins.comment")
spec.insert("plugins.navic")
spec.insert("plugins.navbuddy")
spec.insert("plugins.surround")
spec.insert("plugins.autopair")
spec.insert("plugins.harpoon")
spec.insert("plugins.breadcrumbs")
spec.insert("plugins.indentline")
spec.insert("plugins.bqf")
spec.insert("plugins.ufo")
spec.insert("plugins.gopher")
spec.insert("plugins.trouble")
spec.insert("plugins.dressing")
spec.insert("plugins.git")
spec.insert("plugins.gitgraph")
spec.insert("plugins.lsp.dart_data_class")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = spec.LAZY_PLUGIN_SPEC,
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

-- vim.cmd("colorscheme tokyonight")
vim.cmd("colorscheme gruvbox")
