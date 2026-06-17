return {
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { 'rebelot/kanagawa.nvim', lazy = true },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme tokyonight-night]]
    end,
  },
}
