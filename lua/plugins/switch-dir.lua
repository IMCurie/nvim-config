return {
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("project")
    end,
    keys = {
      {
        "<leader>pp",
        function()
          require("telescope").extensions.project.project({})
        end,
        desc = "Switch project",
      },
    },
  },
}
