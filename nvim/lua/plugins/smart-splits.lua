return {
  'mrjones2014/smart-splits.nvim',
  build = './kitty/install-kittens.bash',
  lazy = false,
  config = function()
    local ss = require('smart-splits')
    ss.setup({ multiplexer_integration = 'kitty' })
    vim.keymap.set('n', '<C-h>', ss.move_cursor_left)
    vim.keymap.set('n', '<C-t>', ss.move_cursor_down)
    vim.keymap.set('n', '<C-n>', ss.move_cursor_up)
    vim.keymap.set('n', '<C-s>', ss.move_cursor_right)
  end,
}
