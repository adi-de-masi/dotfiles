return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    -- 'williamboman/mason.nvim',
    -- 'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
  },
  config = function()
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    Log_to_nvim_file "[nvim-lspconfig] start config"
    local opts = { silent = true }

    function optsWithDesc(desc)
      return { desc = desc }
    end

    -- the following diagnostic commands don't work :(
    -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    --- end of not working

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, optsWithDesc "previous diagnostics")
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, optsWithDesc "next diagnostics")

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      function bufoptsWithDesc(desc)
        return { silent = true, buffer = bufnr, desc = desc }
      end

      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, bufoptsWithDesc "Open symbol picker")
      vim.keymap.set(
        "n",
        "<leader>S",
        builtin.lsp_dynamic_workspace_symbols,
        bufoptsWithDesc "Open symbol picker (workspace)"
      )
      vim.keymap.set("n", "<leader>dd", builtin.diagnostics, bufoptsWithDesc "Open diagnostics picker")
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufoptsWithDesc "Declaration")
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufoptsWithDesc "Definition")
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufoptsWithDesc "LSP Hover")
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufoptsWithDesc "Implementation")
      -- TODO: C-k is already used for going to the top split figure out a different keymap
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufoptsWithDesc("Signature help"))
      -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufoptsWithDesc(""))
      -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufoptsWithDesc())
      -- vim.keymap.set('n', '<leader>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, bufoptsWithDesc())
      vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufoptsWithDesc "Type definition")
      vim.keymap.set("n", "<leader>lr", function()
        -- when rename opens the prompt, this autocommand will trigger
        -- it will "press" CTRL-F to enter the command-line window `:h cmdwin`
        -- in this window I can use normal mode keybindings
        local cmdId
        cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
          callback = function()
            local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
            vim.api.nvim_feedkeys(key, "c", false)
            vim.api.nvim_feedkeys("0", "n", false)
            -- autocmd was triggered and so we can remove the ID and return true to delete the autocmd
            cmdId = nil
            return true
          end,
        })
        vim.lsp.buf.rename()
        -- if LPS couldn't trigger rename on the symbol, clear the autocmd
        vim.defer_fn(function()
          -- the cmdId is not nil only if the LSP failed to rename
          vim.api.nvim_del_autocmd(cmdId)
          if cmdId then
          end
        end, 500)
      end, bufoptsWithDesc "Rename symbol")
      vim.keymap.set("n", "<leader>lw", function()
        vim.diagnostic.setloclist()
      end, { desc = "Diagnostic setloclist" })
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, bufoptsWithDesc "Run code action")
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufoptsWithDesc "references")
      -- vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufoptsWithDesc("Format using LSP"))
    end
    Log_to_nvim_file "[nvim-lspconfig] end config"

    -- setting autocompletion for nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require "lspconfig"
    Log_to_nvim_file "[LSP]: beginning lsp setup"
    lspconfig["gopls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    Log_to_nvim_file "[LSP]: gopls done"
    lspconfig["ts_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    Log_to_nvim_file "[LSP]: tl_ls done"
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- this line disables messages about adding libraries to work environment
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
    Log_to_nvim_file "[LSP]: lua_ls done"
    if vim.fn.executable "solargraph" == 1 then
      lspconfig["solargraph"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          flags = {
            debounce_text_changes = 150,
          },
        },
      }
    end
    Log_to_nvim_file "[LSP]: solargraph done"
    lspconfig["marksman"].setup {}
    Log_to_nvim_file "[LSP]: marksman done"
  end,
  Log_to_nvim_file "done lsp setup",
}
