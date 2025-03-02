return { 
  'echasnovski/mini.nvim',
  lazy = false,
  version = false,
  config = function()
    require('mini.ai').setup()
  end,
}
