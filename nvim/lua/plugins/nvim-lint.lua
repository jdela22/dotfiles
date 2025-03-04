return {
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

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave', 'TextChanged' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
