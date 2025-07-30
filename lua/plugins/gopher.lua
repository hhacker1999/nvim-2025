return {
  "olexsmir/gopher.nvim",
  commit = "a5becfc3299920129ab38eab74565b80b1a847d5",
  event = "VeryLazy",
  ft = "go",
  config = function()
    local gopher = require "gopher"
    gopher.setup {
      -- Install all of this dependencies
      -- go get -u github.com/koron/iferr
      -- go install github.com/josharian/impl@latest
      -- go install github.com/fatih/gomodifytags@latest
      commands = {
        dlv = "dlv",
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "~/go/bin/gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    }
    local keymap = vim.keymap.set
    keymap("n", "<leader>ge", ":GoIfErr<cr>", { silent = true })
  end,
}
