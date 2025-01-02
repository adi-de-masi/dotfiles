return {
  'adi-de-masi/tasko.nvim',
  dir = '/Users/adidemasi/code/tasko.nvim',
  lazy = false,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('tasko').setup {
      provider = 'todoist',
    }
  end,
}