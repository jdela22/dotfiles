vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    -- Rename the variable under your cursor
    --  Most Language Servers support renaming across files, etc.
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap
    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- Open diagnostic in floating window
    map('<leader>cd', ':lua vim.diagnostic.open_float()<CR>', 'Diagnostic Floating window')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    vim.lsp.document_color.enable(false, { bufnr = event.buf })
  end,
})

--     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
--     { 'j-hui/fidget.nvim', opts = {} },

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Can't seem to use eslint_d with the native lsp (there is no eslint_d lspconfig)
local servers = {
  gopls = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  ts_ls = {},
  tailwindcss = {},
  eslint_d = {},
  eslint = {},
  lua_ls = {},

  astro = {},
  css_variables = {},
  biome = {},
}

require('mason').setup()

-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua', -- Used to format lua code
  'prettierd',
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
  ensure_installed = servers,
  automatic_enable = {
    exclude = { 'cssls' },
  },
}

-- CSS LSP doesn't clamp conversion to rgb for high-chroma oklch colors
-- Nvim client crashes when trying to interpret the Out of bounds values
--
-- Tailwind causes unknown @ rules warnings we also ignore
vim.lsp.config.cssls = vim.tbl_deep_extend('force', vim.lsp.config.cssls or {}, {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
  -- on_attach = function(client)
  --   client.server_capabilities.colorProvider = false
  -- end,
})
vim.lsp.enable 'cssls'
