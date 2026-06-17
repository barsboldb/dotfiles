return {
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'onsails/lspkind.nvim', lazy = true },

  { 'ThePrimeagen/vim-be-good', cmd = 'VimBeGood' },

  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    config = function()
      require('inc_rename').setup()
    end,
  },

  {
    'nvimdev/indentmini.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('indentmini').setup()
      vim.cmd.highlight('IndentLine guifg=#444444')
      vim.cmd.highlight('IndentLineCurrent guifg=#666666')
    end,
  },

  {
    'petertriho/nvim-scrollbar',
    event = 'VeryLazy',
    config = function()
      require('scrollbar').setup()
    end,
  },

  {
    'esmuellert/codediff.nvim',
    cmd = 'CodeDiff',
    opts = {
      keymaps = { view = { toggle_layout = 'l' } },
    },
  },

  { 'sylvanfranklin/omni-preview.nvim', opts = {} },
  { 'chomosuke/typst-preview.nvim', lazy = true },
  {
    'toppair/peek.nvim',
    lazy = true,
    build = 'deno task --quiet build:fast',
  },

  {
    'hat0uma/csvview.nvim',
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { '#', '//' } },
      keymaps = {
        textobject_field_inner = { 'if', mode = { 'o', 'x' } },
        textobject_field_outer = { 'af', mode = { 'o', 'x' } },
        jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
        jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
        jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
        jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
      },
    },
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
  },

  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, 'http')
      end,
    },
  },

  {
    'otavioschwanck/arrow.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    opts = {
      show_icons = true,
      leader_key = ',',
      buffer_leader_key = 'k',
    },
  },
}
