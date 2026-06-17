return {
  'stevearc/conform.nvim',
  keys = { { '<leader>lf', mode = 'v' } },
  config = function()
    local map = require('keymapping')
    local conform = require('conform')
    conform.setup({
      formatters_by_ft = {
        c          = { 'clang-format' },
        go         = { 'gofmt' },
        javascript = { 'prettier', 'eslint_d' },
        typescript = { 'prettier', 'eslint_d' },
      },
    })
    map('v', '<leader>lf', function()
      conform.format({ async = true, lsp_format = 'fallback' }, function(err)
        if not err then
          local mode = vim.api.nvim_get_mode().mode
          if vim.startswith(string.lower(mode), 'v') then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
          end
        end
      end)
    end, { expr = true, desc = "Format code" })
  end,
}
