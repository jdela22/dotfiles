-- TODO: Make this a part of the mini module?
return {
  'echasnovski/mini.statusline',
  version = '*',
  config = function()
    require('mini.statusline').setup()
  end,
}
