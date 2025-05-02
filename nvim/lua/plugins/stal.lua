local buffer_ok, bufferline = pcall(require, 'bufferline')
local staline_ok, staline = pcall(require, 'staline')

if staline_ok then
  staline.setup({
    defaults = {
      branch_symbol = ' ',
    },
    mode_icons = {
      n = "NORMAL",
      v = "VISUAL",
      i = "INSERT",
      c = "COMMAND"
    }
  })
end


if buffer_ok then
  bufferline.setup()
end

