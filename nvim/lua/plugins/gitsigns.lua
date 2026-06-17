return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local map = require('keymapping')
    require('gitsigns').setup({
      on_attach = function()
        local gs = package.loaded.gitsigns
        map('n', '<leader>gl', gs.toggle_current_line_blame)
        map('n', '<leader>gh', gs.preview_hunk)
      end,
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1500,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    })
  end,
}
