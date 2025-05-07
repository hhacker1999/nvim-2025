local M = {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
}

function M.config()
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    keymap("n", "<leader>o", "<cmd>Navbuddy<cr>", opts)

    local navbuddy = require "nvim-navbuddy"
    -- local actions = require("nvim-navbuddy.actions")
    navbuddy.setup {
        window = {
            border = "rounded",
            size = "80%",
        },
        icons = require("plugins.icons.icons").kind,
        lsp = { auto_attach = true },
    }
    keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
    keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
end

return M
