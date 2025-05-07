local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "nvim-lua/plenary.nvim",
    },
}

M.servers = {
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
    "astro",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "tailwindcss",
    "zls"
}

function M.config()
    require("mason").setup {
        ui = {
            border = "rounded",
        },
    }
    require("mason-lspconfig").setup {
        ensure_installed = M.servers,
    }
end

return M
