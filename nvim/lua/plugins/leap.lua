return {
  'https://codeberg.org/andyg/leap.nvim',
  keys = { 'j', 'k' },
  config = function()
    local map = require('keymapping')
    local leap = require('leap')
    leap.opts.safe_labels = "lrgpfgfjqkxbwvzueo"
    leap.init_highlight(true)
    map('n', 'j', function()
      leap.leap { target_windows = { vim.fn.win_getid() } }
    end)
    map('v', 'j', function()
      leap.leap { target_windows = { vim.fn.win_getid() } }
    end)
    map('n', 'J', function()
      local wins = vim.tbl_filter(
        function(win) return vim.api.nvim_win_get_config(win).focusable end,
        vim.api.nvim_tabpage_list_wins(0)
      )
      leap.leap { target_windows = wins }
    end)
  end,
}
