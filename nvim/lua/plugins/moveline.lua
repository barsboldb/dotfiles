return {
  'willothy/moveline.nvim',
  build = 'make',
  keys = {
    { '<M-n>', mode = { 'n', 'v' } },
    { '<M-t>', mode = { 'n', 'v' } },
  },
  config = function()
    local moveline = require('moveline')
    vim.keymap.set('n', '<M-n>', moveline.up)
    vim.keymap.set('n', '<M-t>', moveline.down)
    vim.keymap.set('v', '<M-n>', moveline.block_up)
    vim.keymap.set('v', '<M-t>', moveline.block_down)
  end,
}
