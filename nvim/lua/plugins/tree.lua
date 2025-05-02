local map = require('keymapping')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 40,
    side = "right",
  },
})

vim.api.nvim_create_autocmd({"QuitPre"}, {
  callback = function() vim.cmd("NvimTreeClose") end,
})

map('n', '<leader>E', ':NvimTreeToggle<cr>', {silent = true})
