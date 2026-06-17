return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  config = function()
    require('nvim-treesitter.configs').setup {
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }

    require('nvim-treesitter-textobjects').setup { move = { set_jumps = true } }

    local move   = require('nvim-treesitter-textobjects.move')
    local select = require('nvim-treesitter-textobjects.select')

    -- navigation
    local nav = {
      { 'gsf', 'gSf', '@function.outer',  true  },
      { 'gsF', 'gSF', '@function.outer',  false },
      { 'gsc', 'gSc', '@class.outer',     true  },
      { 'gsC', 'gSC', '@class.outer',     false },
      { 'gsa', 'gSa', '@parameter.inner', true  },
    }
    for _, m in ipairs(nav) do
      local next_key, prev_key, query, start = m[1], m[2], m[3], m[4]
      vim.keymap.set({ 'n', 'x', 'o' }, next_key, function()
        if start then move.goto_next_start(query) else move.goto_next_end(query) end
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, prev_key, function()
        if start then move.goto_previous_start(query) else move.goto_previous_end(query) end
      end)
    end

    -- text objects
    local textobjs = {
      { 'af', '@function.outer' }, { 'if', '@function.inner' },
      { 'ac', '@class.outer' },    { 'ic', '@class.inner' },
      { 'aa', '@parameter.outer' },{ 'ia', '@parameter.inner' },
    }
    for _, t in ipairs(textobjs) do
      vim.keymap.set({ 'x', 'o' }, t[1], function() select.select_textobject(t[2], 'textobjects') end)
    end
  end,
}
