local o = vim.opt
local keycode = vim.keycode

vim.g.mapleader = keycode'<space>'
vim.g.loaded_matchparen = 1

-- o.statuscolumn = "%s%#AbsoluteColumn#%l%1*│%r "

local options = {
	hlsearch = true,
	ignorecase = true,
	smartcase = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	undofile = true,
	updatetime = 700,
	expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cinoptions = 'l1,:0',
  cursorline = true,
  number = true,
  relativenumber = true,
  signcolumn = 'yes',
  scrolloff = 8,
  mouse='',
  laststatus = 3,
}

-- filetype plugin intend on

for k, v in pairs(options) do
  o[k] = v
end

vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd('VimResized', { command = 'tabdo wincmd =' })
