local function map(mode, l, r, opts)
  opts = opts or { noremap = true, silent = true }
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

require('cyrillic')

-- Dvorak Normal
map("n", "h", "h")
map("n", "t", "j")
map("n", "n", "k")
map("n", "s", "l")

map("n", "T", "6j")
map("n", "N", "6k")
map("n", "H", ":bprev<cr>", {silent = true})
map("n", "S", ":bnext<cr>", {silent = true})

-- Dvorak Visual
map("v", "h", "h")
map("v", "t", "j")
map("v", "n", "k")
map("v", "s", "l")

map("v", "T", "6j")
map("v", "N", "6k")

map('n', '<leader>cc', ':b# | bd#<cr>', {silent = true})


-- Dvorak Search
map('n', 'm', 'n')
map('n', 'M', 'N')

-- Stays in visual mode after indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

map("n", "<leader>gl", ":Gitsign")

map("n", "<leader>o", "<C-o>", { noremap = true })
map("n", "<leader>i", "<C-i>", { noremap = true })

map("i", "<M-BS>", "<C-w>", {})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "netrw",
--   callback = function()
--     print("hello")
--     local opts = { buffer = true, noremap = true, silent = true }
--     map("n", "h", "-^", opts)       -- go up directory
--     map("n", "t", "j", opts)       -- go up directory
--     map("n", "n", "k", opts)     -- open file/directory
--     map("n", "q", ":q<CR>", opts)   -- quit netrw
--   end
-- })

return map
