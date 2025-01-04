return {
  'epwalsh/obsidian.nvim',
  version = '*', -- Use the latest release
  lazy = true,
  event = {
    -- Load obsidian.nvim only when opening files in the vault
    'BufReadPre '
      .. vim.fn.expand '~/AdisObsidianVault'
      .. '/*.md',
    'BufNewFile ' .. vim.fn.expand '~/AdisObsidianVault' .. '/*.md',
  },

  dependencies = {
    'nvim-lua/plenary.nvim', -- Required dependency
  },

  opts = {
    workspaces = {
      {
        name = 'work',
        path = '~/AdisObsidianVault', -- Define your vault path
      },
    },
    templates = {
      folder = '~/AdisObsidianVault/Templates',
      date_format = '%d.%m.%Y',
      time_format = '%H:%M',
    },
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    ui = {
      -- recommended here: https://github.com/MeanderingProgrammer/render-markdown.nvim
      enabled = false,
    },
  },

  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ''
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. '-' .. suffix
  end,

  note_path_func = function(spec)
    local path = spec.dir / tostring(spec.title)
    return path:with_suffix '.md'
  end,
}
