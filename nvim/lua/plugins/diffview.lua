return {
  'sindrets/diffview.nvim',
  keys = { { '<leader>dv', '<cmd>DiffviewOpen<cr>', desc = 'Basic diffview' }, { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'Close basic diffview' } },
  opts = {
    enhanced_diff_hl = true,
    view = { default = { layout = 'diff2_vertical' } },
    hooks = {
      diff_buf_win_enter = function()
        vim.notify 'inside hook - setting hl group'
        vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '', bg = '#65a194' })
      end,
    },
  },
  -- config = function()
  --   vim.notify 'inside diffview config'
  --   vim.api.nvim_set_hl(0, 'hl-DiffAdd', { fg = '#00FF00', bg = '#00FF00' })
  --   require('diffview').setup { enhanced_diff_hl = true }
  -- end,
}
