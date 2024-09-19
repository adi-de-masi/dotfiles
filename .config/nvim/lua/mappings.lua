require "nvchad.mappings"

-- add yours here
--
-- local nomap = vim.keymap.del
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<A-j>", "<cmd> m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd> m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })
map("v", "<leader>y", '"*y', { desc = "Yank to clipboard" })

map("n", "<leader>s", ":w", { desc = "alias to :w"})
map("n", "<leader>lf",
  function()
    vim.lsp.buf.format { async = true }
  end,
  { desc = "LSP format" }
)
map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
map("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })
