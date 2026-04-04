local jsFormatters = function(bufnr)
  if require('conform').get_formatter_info('biome-check', bufnr).available then
    return { 'biome-check' }
  else
    return { 'eslint_d', 'prettierd' }
  end
end

return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = true,
    format_on_save = {
      timeout_ms = 1500,
      lsp_fallback = true,
    },
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      astro = jsFormatters,
      typescript = jsFormatters,
      typescriptreact = jsFormatters,
      javascript = jsFormatters,
      javascriptreact = jsFormatters,
      json = jsFormatters,
      html = jsFormatters,
      css = jsFormatters,
    },
  },
}
