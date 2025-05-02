local function map(mode, l, r, opts)
  opts = opts or { noremap = true, silent = true }
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end
local leap_ok, leap = pcall(require, 'leap')

if not leap_ok then
  return
end

leap.opts.safe_labels = "lrgpfcgfjqkxbwvzueo"
leap.init_highlight(true)

map('n', 'j', function ()
  local current_window = vim.fn.win_getid()
  leap.leap { target_windows = { current_window } }
end)

map('v', 'j', function ()
  local current_window = vim.fn.win_getid()
  leap.leap { target_windows = { current_window } }
end)

map('n', 'J', function ()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  leap.leap { target_windows = focusable_windows_on_tabpage }
end)
