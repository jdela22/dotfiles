return {
  enabled = true,
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'
    local eslint = { 'biomejs', 'eslint_d' }

    lint.linters_by_ft = {
      astro = eslint,
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
