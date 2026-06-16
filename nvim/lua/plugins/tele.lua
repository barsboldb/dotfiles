local map = require('keymapping')

local status, telescope = pcall(require, 'telescope')
local actions_ok, actions = pcall(require, 'telescope.actions')

if not status or not actions_ok then
  return
end

local builtin_ok, builtin = pcall(require, 'telescope.builtin')

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
      file_ignore_patterns = {"venv/", ".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.zip", "target/"},
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
      }
    }
  }
}

telescope.load_extension('ui-select')


if builtin_ok then
  map('n', '<leader>f', builtin.find_files)
  map('n', '<leader>b', builtin.buffers)
  map('n', '<leader>F', builtin.live_grep)
  map('n', '<leader>df', builtin.diagnostics)
  map('n', '<leader>/', builtin.current_buffer_fuzzy_find)
end
