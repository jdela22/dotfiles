return {
  'WolfeCub/harpeek.nvim',
  config = function()
    require('harpeek').setup { format = 'shortened' }
  end,
  keys = { {
    '<leader>p',
    function()
      require('harpeek').toggle()
    end,
  } },
}
