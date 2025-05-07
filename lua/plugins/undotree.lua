local M = {
  "mbbill/undotree",
  config = function()
    -- Undo Tree
    local keymap = vim.keymap.set
    keymap("n", "<leader>u", vim.cmd.UndotreeToggle, { silent = true })
  end,
}

return M
