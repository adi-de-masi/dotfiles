local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  { "onsails/lspkind.nvim", config = true },
  {
    "axkirillov/hbac.nvim",
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      { "onsails/lspkind.nvim" },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
      formatting = {
        format = function(entry, vim_item)
          local lspkind = require "lspkind"
          return lspkind.cmp_format {
            menu = "",
            mode = "symbol",
            max_width = 50,
            symbol_map = { Copilot = "" },
          }(entry, vim_item)
        end,
      },
    },
  },

  {
    "folke/which-key.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      local present, wk = pcall(require, "which-key")
      if not present then
        return
      end
      wk.register {
        -- add group
        ["<leader>"] = {
          f = { name = "+find" },
          l = { name = "+lsp" },
        },
      }
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  { "nvim-neotest/nvim-nio" },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- local Config = require("lazyvim.config")
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      -- for name, sign in pairs(Config.icons.dap) do
      --   sign = type(sign) == "table" and sign or { sign }
      --   vim.fn.sign_define(
      --     "Dap" .. name,
      --     { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      --   )
      -- end

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true
          },
          -- Debug nodejs processes (make sure to add --inspect when you run the process)
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true
          },
          -- Debug web applications (client side)
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = "Enter URL: ",
                  default = "http://localhost:3000",
                }, function(url)
                  if url == nil or url == "" then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false
          },
          -- Divider for the launch.json derived configs
          {
            name = "----- ↓ launch.json configs ↓ -----",
            type = "",
            request = "launch"
          },
        }
      end
    end,
    keys = {
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>da",
        function()
          if vim.fn.filereadable(".vscode/launch.json") then
            local dap_vscode = require("dap.ext.vscode")
            dap_vscode.load_launchjs(nil, {
              ["pwa-node"] = js_based_languages,
              ["chrome"] = js_based_languages,
              ["pwa-chrome"] = js_based_languages,
            })
          end
          require("dap").continue()
        end,
        desc = "Run with Args",
      },
    },
    dependencies = {
      -- Install the vscode-js-debug adapter
      {
        "microsoft/vscode-js-debug",
        -- After install, build it and rename the dist directory to out
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("dap-vscode-js").setup({
            -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- node_path = "node",

            -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

            -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
            -- debugger_cmd = { "js-debug-adapter" },

            -- which adapters to register in nvim-dap
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
            },

            -- Path for file logging
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

            -- Logging level for output to file. Set to false to disable logging.
            -- log_file_level = false,

            -- Logging level for output to console. Set to false to disable console output.
            -- log_console_level = vim.log.levels.ERROR,
          })
        end,
      },
      {
        "Joakker/lua-json5",
        build = "./install.sh",
      },
    },
  },

  {
    "David-Kunz/jester",
    config = function()
      require("custom.configs.dap")
      require("jester").setup({
        cmd = "yarn run jest --coverage=false -t '$result' -- $file", -- run command
        identifiers = { "test", "it" }, -- used to identify tests
        prepend = { "describe" }, -- prepend describe blocks
        expressions = { "call_expression" }, -- tree-sitter object used to scan for tests/describe blocks
        path_to_jest_run = "jest", -- used to run tests
        path_to_jest_debug = "./node_modules/.bin/jest", -- used for debugging
        terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
        dap = { -- debug adapter configuration
          type = "pwa-node",
          request = "launch",
          cwd = vim.fn.getcwd(),
          runtimeArgs = { "--inspect-brk", "$path_to_jest", "--no-coverage", "-t", "$result", "--", "$file" },
          args = { "--no-cache" },
          sourceMaps = false,
          protocol = "inspector",
          skipFiles = { "<node_internals>/**/*.js" },
          console = "integratedTerminal",
          port = 9229,
          disableOptimisticBPs = true,
        },
      })
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
