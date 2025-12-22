return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("telescope").load_extension("fzf")
  end,
  keys = {
    {
      "<C-p>",
      function()
        local builtin = require("telescope.builtin")
        local ok = pcall(builtin.git_files, { show_untracked = true })
        if not ok then builtin.find_files() end
      end,
      desc = "Telescope find files"
    },
    {
      "<leader>ps",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope live grep"
    },
  }
}
