return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'L3MON4D3/LuaSnip', 'onsails/lspkind.nvim' },
    opts = {
      snippets = { preset = 'luasnip' },
      keymap = {
        preset = 'none',
        ['<CR>']    = { 'accept', 'fallback' },
        ['<Tab>']   = { 'snippet_forward', 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>']   = { 'cancel', 'fallback' },
      },
      appearance = {
        kind_icons = {
          Text = "", Method = "", Function = "ƒ",
          Constructor = "", Copilot = "", Snippet = "",
        },
      },
      sources = {
        default = { 'lsp', 'buffer', 'snippets', 'path' },
      },
      completion = {
        documentation = { auto_show = true },
      },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    event = 'InsertEnter',
    config = function()
      require('luasnip.loaders.from_snipmate').load({ paths = '~/.config/nvim/lua/snippets' })
    end,
  },
}
