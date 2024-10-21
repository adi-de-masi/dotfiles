require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<leader>b")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>lw", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })
map("n", "<leader>h", ":set nohlsearch<CR>", { desc = "set no highlight search" })
map("n", "<A-j>", "<cmd> m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd> m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })
map("v", "<leader>y", '"*y', { desc = "Yank to clipboard" })

map("n", "<leader>w", ":w <CR>", { desc = "alias to :w" })
map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
map("n", "<leader>m", "<Cmd>MarkdownPreview<CR>", { silent = true })
map("n", "<leader>gg", "<Cmd> LazyGit <CR>", { desc = "start LazyGit" })

map("n", "<leader>f", " Run/Debug")
map("n", "<leader>f", "󰈞 Find")
map("n", "<leader>l", " Lsp")
map("n", "<leader>t", " Telescope")
map("n", "<leader>o", " Obsidian")
map("n", "<leader>os", "<Cmd>ObsidianSearch<CR>", { silent = true })
map("n", "<leader>ob", "<Cmd>ObsidianBacklink<CR>", { silent = true })
map("n", "<leader>ot", "<Cmd>ObsidianToday<CR>", { silent = true })
map("n", "<leader>od", "<Cmd>ObsidianDailies<CR>", { silent = true })
map("n", "<leader>oq", "<Cmd>ObsidianQuickSwitch<CR>", { silent = true })
map("n", "<leader>on", "<Cmd>ObsidianNew<CR>", { silent = true })

map("n", "<leader>bdl", "require('nvchad.tabufline').closeBufs_at_direction('left')")
map("n", "X", ":only<CR>", { desc = "Close other panes" })
