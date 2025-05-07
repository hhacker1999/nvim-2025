local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<leader>hf", "<cmd>lua require('plugins.harpoon').mark_file()<cr>", opts)
  keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
  keymap("n", "<leader>hl", ":lua require('harpoon.ui').nav_next()<CR>", opts)
  keymap("n", "<leader>hh", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
  keymap("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
  keymap("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
  keymap("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
  keymap("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
  keymap("n", "<leader>h5", ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
  keymap("n", "<leader>h6", ":lua require('harpoon.ui').nav_file(6)<CR>", opts)
  keymap("n", "<leader>h7", ":lua require('harpoon.ui').nav_file(6)<CR>", opts)

  vim.api.nvim_create_autocmd({ "filetype" }, {
    pattern = "harpoon",
    callback = function()
      vim.cmd [[highlight link HarpoonBorder TelescopeBorder]]
      -- vim.cmd [[setlocal nonumber]]
      -- vim.cmd [[highlight HarpoonWindow guibg=#313132]]
    end,
  })
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
