vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'typescript', 'astro', 'tsx', 'typescriptreact' },
  callback = function()
    vim.treesitter.start()
  end,
})
