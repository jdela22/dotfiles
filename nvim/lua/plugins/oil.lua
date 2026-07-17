return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      keymaps = { ['<C-h>'] = vim.notify 'you pressed c-h', ['<M-h>'] = 'actions.select_split', ['<C-l>'] = false },
      view_options = { show_hidden = true },
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent diretory' })
    vim.keymap.set('n', '<space>-', require('oil').toggle_float)
  end,
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  lazy = false,
}
