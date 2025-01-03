return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end,
    },
    { 'onsails/lspkind.nvim' },
  },
  opts = {
    sources = {
      { name = 'nvim_lsp', group_index = 2 },
      { name = 'copilot', group_index = 2 },
      { name = 'luasnip', group_index = 2 },
      { name = 'buffer', group_index = 2 },
      { name = 'nvim_lua', group_index = 2 },
      { name = 'path', group_index = 2 },
    },
    formatting = {
      format = function(entry, vim_item)
        local lspkind = require 'lspkind'
        return lspkind.cmp_format {
          menu = '',
          mode = 'symbol',
          max_width = 50,
          symbol_map = { Copilot = '' },
        }(entry, vim_item)
      end,
    },
  },
}
