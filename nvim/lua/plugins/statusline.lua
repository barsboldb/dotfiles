return {
  'tamton-aquib/staline.nvim',
  dependencies = { 'akinsho/bufferline.nvim', 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('staline').setup({
      defaults = { branch_symbol = ' ' },
      mode_icons = { n = "NORMAL", v = "VISUAL", i = "INSERT", c = "COMMAND" },
    })
    require('bufferline').setup()
  end,
}
