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
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd> w <CR>", "write file", opts = { nowait = true } },
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
  },
  v = {
    [">"] = { ">gv", "indent" },
    [",y"] = { "\"*y", "Yank to clipboard"}
  },
}

-- more keybinds!

return M
