---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    -- required to get NvimTmuxNavigation to work :(
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-s>"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>wb"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>fm"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>ld"] = "",
    ["<leader>lf"] = "",
    ["<leader>q"] = "",
    ["<leader>x"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd> w <CR>", "write file", opts = { nowait = true } },
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>m"] = { "<cmd> MarkdownPreview <CR>", "Markdown Preview" },
    ["<leader>zp"] = { "<cmd> Copilot panel <CR>", "Copilot Panel" },

    -- lsp starts with l
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>lI"] = { "<cmd> Mason <CR>", "Mason Info" },
    ["<leader>h"] = { "<cmd> nohlsearch <CR>", "Stop Highlighting" },
    ["<A-j>"] = { "<cmd> m .+1<CR>==", "Move line down" },
    ["<A-k>"] = { "<cmd> m .-2<CR>==", "Move line up" },
    ["X"] = { ":lua require('nvchad.tabufline').closeOtherBufs() <CR>", "Close other buffers" },
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "start LazyGit" },
    ["<leader>lw"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
    ["<leader>x"] = { ":%!jq . <CR>" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    [",y"] = { '"*y', "Yank to clipboard" },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move selected block down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move selected block up" },
  },
}

-- more keybinds!

return M
