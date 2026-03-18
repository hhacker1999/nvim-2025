return {
  'wa11breaker/dart-data-class-generator.nvim',
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
  ft = 'dart',
  config = function()
    require("dart-data-class-generator").setup({})
  end
}
