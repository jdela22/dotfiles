return {
  enabled = false,
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'
    local eslint = { 'eslint_d' }

    lint.linters_by_ft = {
      javascript = eslint,
      typescript = eslint,
      javascriptreact = eslint,
      typescriptreact = eslint,
    }

    -- Possible solution to updated eslint lsp? not working atm
    local eslintcli = lint.linters.eslint_d
    eslintcli.args = { '--no-warn-ignored' }

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave', 'TextChanged' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
