return {
  "adi-de-masi/tasko.nvim",
  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  opts = {
    provider = "todoist",
  },
}
