return {
  'hedyhli/outline.nvim',
  cmd = { 'Outline', 'OutlineOpen' },
  keys = { '<leader>e' },
  config = function()
    local map = require('keymapping')
    require('outline').setup({
      outline_items = { show_symbol_lineno = true },
      outline_window = {
        show_cursorline = true,
        hide_cursor = true,
        width = 23,
        jump_highlight_duration = 1000,
      },
      symbols = {
        icon_fetcher = 'lspkind',
        icons = {
          Method   = { icon = "ƒ", hl = 'Function' },
          Function = { icon = "ƒ", hl = 'Function' },
          Class    = { icon = '', hl = 'Type' },
          Struct   = { icon = '', hl = 'Type' },
        },
      },
    })
    map('n', '<leader>e', ':Outline!<CR>', { noremap = true, silent = true })
    vim.api.nvim_create_autocmd('QuitPre', {
      callback = function() vim.cmd("OutlineClose") end,
    })
  end,
}
