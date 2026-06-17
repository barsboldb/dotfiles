return {
  'kylechui/nvim-surround',
  dependencies = { 'windwp/nvim-autopairs' },
  event = 'VeryLazy',
  config = function()
    require('nvim-autopairs').setup({
      fast_wrap = {
        map = '<C-l>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
      },
    })
    require('nvim-surround').setup()
  end,
}
