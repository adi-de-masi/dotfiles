return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>lf',
      function()
        require('conform').format { async = false }
      end,
      mode = 'n',
      desc = 'Format buffer',
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      html = { 'eslint_d' },
      css = { 'eslint_d' },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = 'fallback',
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { '-i', '2' },
      },
    },
    eslint_d = {
      args = { '--fix', '--stdin', '--stdin-filename', '$FILENAME' },
      cwd = function(bufnr)
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.dirname(bufname)
      end,
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
