return {
  'esmuellert/vscode-diff.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  cmd = 'CodeDiff',
  config = function()
    require('codediff').setup {}

    -- Patch compat.lsp_notify to drop textDocument/didOpen for codediff:// URIs.
    -- Some LSPs (astro-ls/volar) crash when they receive didOpen with a codediff://
    -- URI because vscode-uri's URI.parse() throws on URI schemes with 4+ slashes
    -- (e.g., codediff:////...). Since apply_semantic_tokens sends didOpen directly
    -- to the LSP client via client:notify() (bypassing all Neovim filters), we
    -- need to intercept at the notification level.
    local compat = require 'codediff.core.compat'
    local orig_notify = compat.lsp_notify
    compat.lsp_notify = function(client, method, params)
      if method == 'textDocument/didOpen' and params and params.textDocument and params.textDocument.uri:match '^codediff://' then
        return
      end
      return orig_notify(client, method, params)
    end
  end,
}
