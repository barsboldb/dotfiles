local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorschemes (only the active one loads at startup)
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "folke/tokyonight.nvim", priority = 1000 },
  { 'rebelot/kanagawa.nvim', lazy = true },

  -- Libraries: loaded on demand when required by other plugins
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'onsails/lspkind.nvim', lazy = true },

  'tpope/vim-commentary',

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
    cmd = 'Telescope',
    keys = { '<leader>f', '<leader>b', '<leader>F', '<leader>df', '<leader>/' },
    config = function() require('plugins.tele') end,
  },

  {
    'alexghergh/nvim-tmux-navigation',
    keys = { '<C-h>', '<C-t>', '<C-n>', '<C-s>' },
    config = function() require('plugins.tmux') end,
  },

  {
    'https://codeberg.org/andyg/leap.nvim',
    keys = { 'j', 'k' },
    config = function() require('plugins.leap') end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('plugins.trst') end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'p00f/clangd_extensions.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugins.lspc') end,
  },

  -- Completion stack: only needed once you start typing
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',
    },
    config = function() require('plugins.ncmp') end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    event = "InsertEnter",
    config = function() require('plugins.snip') end,
  },

  {
    'tamton-aquib/staline.nvim',
    dependencies = { 'akinsho/bufferline.nvim', 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function() require('plugins.stal') end,
  },

  {
    'kylechui/nvim-surround',
    dependencies = { 'windwp/nvim-autopairs' },
    event = 'VeryLazy',
    config = function() require('plugins.surr') end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() require('plugins.sign') end,
  },

  {
    'petertriho/nvim-scrollbar',
    event = 'VeryLazy',
    config = function() require('scrollbar').setup() end,
  },

  {
    'willothy/moveline.nvim',
    build = 'make',
    keys = {
      { '<M-n>', mode = { 'n', 'v' } },
      { '<M-t>', mode = { 'n', 'v' } },
    },
    config = function() require('plugins.move') end,
  },

  {
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { '<leader>e' },
    config = function() require('plugins.outl') end,
  },

  {
    'stevearc/conform.nvim',
    keys = { { '<leader>lf', mode = 'v' } },
    config = function() require('plugins.conform') end,
  },

  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    cmd = 'Oil',
    keys = { '-' },
    config = function() require('plugins.tree') end,
  },

  { 'ThePrimeagen/vim-be-good', cmd = 'VimBeGood' },

  {
    "smjonas/inc-rename.nvim",
    cmd = 'IncRename',
    config = function()
      require("inc_rename").setup()
    end,
  },

  {
    "nvimdev/indentmini.nvim",
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require("indentmini").setup()
      vim.cmd.highlight('IndentLine guifg=#444444')
      vim.cmd.highlight('IndentLineCurrent guifg=#666666')
    end
  },

  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    opts = {
      keymaps = {
        view = {
          toggle_layout = 'l'
        },
      },
    }
  },

  { "sylvanfranklin/omni-preview.nvim", opts = {} },
  { 'chomosuke/typst-preview.nvim', lazy = true },
  {
    "toppair/peek.nvim",
    lazy = true,
    build = "deno task --quiet build:fast",
  },

  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },

  {
    "rest-nvim/rest.nvim",
    ft = 'http',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function (_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    }
  },

  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      show_icons = true,
      leader_key = ',',
      buffer_leader_key = 'k',
    },
  },
})

vim.cmd[[colorscheme tokyonight-night]]
