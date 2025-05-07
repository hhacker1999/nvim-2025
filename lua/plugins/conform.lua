return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt", "golines" },
        sql = { "sqlfmt" },
        proto = { "buf" },
        typescriptreact = { "prettier" },
        ts = { "prettier" },
        js = { "prettier" },
        javascriptreact = { "prettier" },
        -- Conform will run multiple formatters sequentially
      },
      formatters = {
        golines = {
          command = "golines",
          args = {
            "--max-len=100",
          },
        },
        sqlfmt = {
          command = "sqlfmt",
          stdin = true,
          args = { "-", "--fast", "--line-length", "100" },
        },
      },
    }
    local keymap = vim.keymap.set
    local opts = { silent = true }
    keymap(
      "n",
      "<leader>lf",
      ":lua require('conform').format({async=true, lsp_fallback=true})<cr>",
      opts
    )
  end,
}
