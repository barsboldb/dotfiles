local surround_ok, surround = pcall(require, 'nvim-surround')
local pairs_ok, pairs = pcall(require, 'nvim-autopairs')

if pairs_ok then
  pairs.setup({
    fast_wrap = {
      map = "<C-l>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  })
end

if surround_ok then
  surround.setup()
end
