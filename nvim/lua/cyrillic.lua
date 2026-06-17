local function map(mode, l, r, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymap.set(mode, l, r, opts)
end

-- Cyrillic Normal
map("n", "р", "h")
map("n", "о", "j")
map("n", "л", "k")
map("n", "д", "l")

map("n", "О", "6j")
map("n", "Л", "6k")

map("n", "й", "a")
map("n", "ы", "o")
map("n", "а", "i")
