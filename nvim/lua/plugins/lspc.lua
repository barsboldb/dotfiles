local map = require('keymapping')
local lspconfig = vim.lsp.config

function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig('pyright', {
  filetypes = {'python'},
  settings = {
    python = {
      autoSearchPaths = true,
      useLibraryCodeForTypes = true,
      diagnosticMode = "workspace",
      typeCheckingMode = "basic",
    },
    venvPath = ".",
    pythonPath = vim.fn.getcwd() .. "/.env/bin/python"
  }
})

lspconfig('svelte', {
  capabilities = capabilities,
  filetypes = { "svelte" },
  settings = {
    svelte = {
      plugin = {
        html = { completion = { enable = true, emmet = false } },
        svelte = { completion = { enable = true, emmet = true } },
        css = { completion = { enable = true, emmet = true }},
      },
    },
  },
})

lspconfig('ts_ls', {
  init_options = {},
  root_markers = { 'package.json', 'index.html' },
  single_file_support = false,
  filetypes = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
  }
})

lspconfig('tinymist', {})

lspconfig('emmet_language_server', {})

lspconfig('eslint', {
  filetypes = {'vue', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact'}
})

lspconfig('clangd', {
  filetypes = {'c', 'cpp'},
  cmd = {
    'clangd',
    '--offset-encoding=utf-16'
  },
  init_options = {
    fallbackFlags = { '-xc', '-std=c11' }  -- -xc forces C mode
  }
})

lspconfig('rust_analyzer', {
  filetypes = {'rust'},
  capabilities = capabilities,
})

lspconfig('lua_ls', {
  filetypes = {'lua'}
})

lspconfig('gopls', {
  filetypes = {'go'}
})

lspconfig('sourcekit', {
  filetypes = { 'swift', 'objective-c', 'objective-cpp' },
  single_file_support = true,
  root_markers = { 'buildServer.json', '*.xcodeproj', '*.xcworkspace', 'Package.swift', 'compile_commands.json' },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig('cssls', {
  capabilities = capabilities,
})

require("clangd_extensions").setup({
  ast = {
    role_icons = {
      type = "",
      declaration = "",
      expression = "",
      specifier = "",
      statement = "",
      ["template argument"] = "",
    },

    kind_icons = {
      Compound = "",
      Recovery = "",
      TranslationUnit = "",
      PackExpansion = "",
      TemplateTypeParm = "",
      TemplateTemplateParm = "",
      TemplateParamObject = "",
    },
  }
})
-- map('n', '<space>e', vim.diagnostic.open_float)
vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
}
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('UserJumps', {}),
  callback = function()
    vim.cmd[[clearjumps]]
  end
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, opts)
    map('n', 'gr', function() require('telescope.builtin').lsp_references() end, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    map('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map('n', '<leader>gt', vim.lsp.buf.type_definition, opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})



local signs = { Error = "", Warn = "", Hint = "", Info = "כֿ" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.enable({
  'pyright',
  'svelte',
  'ts_ls',
  'tinymist',
  'emmet_language_server',
  'eslint',
  'clangd',
  'rust_analyzer',
  'lua_ls',
  'gopls',
  'sourcekit',
  'cssls',
})

