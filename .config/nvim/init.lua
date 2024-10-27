-- Prints custom log statements to a separate file named nvim.log
function Log_to_nvim_file(msg)
  local log_file = vim.fn.stdpath "log" .. "/nvim.log"

  -- Get the current time with milliseconds
  local seconds, microseconds = vim.loop.gettimeofday()
  local milliseconds = math.floor(microseconds / 1000)
  local timestamp = os.date("%Y-%m-%d %H:%M:%S", seconds) .. string.format(".%03d", milliseconds)

  -- Open the log file in append mode
  local file = io.open(log_file, "a")
  if file then
    file:write(string.format("[%s] %s\n", timestamp, msg)) -- Write message with timestamp
    file:close()
    -- print("Log message written: " .. msg)
  else
    print("Failed to open log file: " .. log_file)
  end
end

-- Example usage
Log_to_nvim_file "\r\n"
Log_to_nvim_file "init.lua, hello"

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
vim.g.mapleader = ","
vim.g.vscode_snippets_path = "~/.config/lvim/snippets/my-snippets"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- if we're running the second brain, change the config and open the search window
if vim.env.IS_SECOND_BRAIN_PROCESS then
  require("lazy").setup({
    {
      "NvChad/NvChad",
      lazy = true,
      import = "nvchad.plugins",
    },
    { import = "plugins" },
    {
      "epwalsh/obsidian.nvim",
      lazy = false,
    },
  }, lazy_config)
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      vim.cmd "ObsidianSearch"
    end,
  })
else
  require("lazy").setup({
    {
      "NvChad/NvChad",
      lazy = true,
      import = "nvchad.plugins",
    },

    { import = "plugins" },
  }, lazy_config)
end

Log_to_nvim_file "lazy setup done"

require('render-markdown').enable()

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "dap")
dofile(vim.g.base46_cache .. "cmp")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
Log_to_nvim_file "init.lua, bye"
