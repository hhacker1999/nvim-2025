local M = {
  "williamboman/mason.nvim",
  commit = "fc98833b6da5de5a9c5b1446ac541577059555be",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245",
    },
    "nvim-lua/plenary.nvim",
  },
}

M.servers = {
  "lua_ls",
  "cssls",
  "html",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman",
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
