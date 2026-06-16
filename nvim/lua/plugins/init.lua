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
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "folke/tokyonight.nvim",
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', event = 'VeryLazy' },
  'nvim-telescope/telescope-ui-select.nvim',
  'tpope/vim-commentary',
  'alexghergh/nvim-tmux-navigation',
  'https://codeberg.org/andyg/leap.nvim',
  'rebelot/kanagawa.nvim',
  {'nvim-treesitter/nvim-treesitter'},

  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',

  'hrsh7th/cmp-vsnip',
  'saadparwaiz1/cmp_luasnip',

  'nvim-tree/nvim-web-devicons',
  'onsails/lspkind.nvim',
  'p00f/clangd_extensions.nvim',

  'petertriho/nvim-scrollbar',
  'kylechui/nvim-surround',
  'windwp/nvim-autopairs',
  'lewis6991/gitsigns.nvim',
  'tamton-aquib/staline.nvim',
  'akinsho/bufferline.nvim',
  'nvim-tree/nvim-tree.lua',

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
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp"
  },
  {
    "sylvanfranklin/omni-preview.nvim",
    opts = {}
  },
  { 'chomosuke/typst-preview.nvim', lazy = true },
  { "toppair/peek.nvim",
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

  'ThePrimeagen/vim-be-good',

  'hedyhli/outline.nvim',
  {
    'stevearc/conform.nvim',
    event = "VeryLazy",
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "nvimdev/indentmini.nvim",
    config = function()
      require("indentmini").setup()
      vim.cmd.highlight('IndentLine guifg=#444444')
      vim.cmd.highlight('IndentLineCurrent guifg=#666666')
    end
  },
  {
    'willothy/moveline.nvim',
    build = 'make',
  },
  {
    "rest-nvim/rest.nvim",
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
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
  },
})

pcall(require, 'plugins.leap')
pcall(require, 'plugins.tmux')
pcall(require, 'plugins.tele')
pcall(require, 'plugins.trst')
pcall(require, 'plugins.lspc')
pcall(require, 'plugins.snip')
pcall(require, 'plugins.ncmp')
pcall(require, 'plugins.stal')
pcall(require, 'plugins.surr')
pcall(require, 'plugins.move')
pcall(require, 'plugins.tree')
pcall(require, 'plugins.sign')
pcall(require, 'plugins.outl')
pcall(require, 'plugins.conform')
require('scrollbar').setup()

vim.cmd[[colorscheme tokyonight-night]]
