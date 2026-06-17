return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
  cmd = 'Telescope',
  keys = { '<leader>f', '<leader>b', '<leader>F', '<leader>df', '<leader>/' },
  config = function()
    local map = require('keymapping')
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup {
      defaults = {
        mappings = {
          n = {
            ['t'] = actions.move_selection_next,
            ['n'] = actions.move_selection_previous,
          }
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = {
            "venv/", ".git/", ".cache", "%.o", "%.a", "%.out",
            "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip", "target/",
          },
        },
      },
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown {} }
      },
    }

    telescope.load_extension('ui-select')

    map('n', '<leader>f', builtin.find_files)
    map('n', '<leader>b', builtin.buffers)
    map('n', '<leader>F', builtin.live_grep)
    map('n', '<leader>df', builtin.diagnostics)
    map('n', '<leader>/', builtin.current_buffer_fuzzy_find)
  end,
}
