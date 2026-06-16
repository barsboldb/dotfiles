local map = require('keymapping')

local status, oil = pcall(require, "oil")

if not status then
  return
end

oil.setup({
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return name == '..' or name == '.git'
    end,
  },
  keymaps = {
    ["<CR>"] = "actions.select",
    ["<C-v>"] = { "actions.select", opts = { vertical = true } },
    ["<C-r>"] = "actions.refresh",
  },
  use_default_keymaps = false,
})

map('n', '-', '<CMD>Oil<CR>', {silent = true})

require('nvim-treesitter.configs').setup {
  ident = {
    enable = true
  }
}
