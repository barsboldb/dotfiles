return {
  'https://codeberg.org/andyg/leap.nvim',
  keys = { 'j', 'k', 'f', 'F' },
  config = function()
    local map = require('keymapping')
    local leap = require('leap')
    leap.opts.safe_labels = "lrgpfgfjqkxbwvzueo"
    leap.init_highlight(true)
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#565f89' })
    map('n', 'j', function()
      leap.leap { target_windows = { vim.fn.win_getid() } }
    end)
    map('v', 'j', function()
      leap.leap { target_windows = { vim.fn.win_getid() } }
    end)
    local function ft(kwargs)
      leap.leap(vim.tbl_deep_extend('keep', kwargs, {
        inputlen = 1,
        inclusive = true,
        opts = {
          labels = '',
          safe_labels = vim.fn.mode(1):match('no?') and '' or nil,
        },
      }))
    end

    local clever_f = require('leap.user').with_traversal_keys('f', 'F')

    vim.keymap.set({ 'n', 'x', 'o' }, 'f', function() ft { opts = clever_f } end)
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', function() ft { backward = true, opts = clever_f } end)

    map('n', 'J', function()
      local wins = vim.tbl_filter(
        function(win) return vim.api.nvim_win_get_config(win).focusable end,
        vim.api.nvim_tabpage_list_wins(0)
      )
      leap.leap { target_windows = wins }
    end)
  end,
}
