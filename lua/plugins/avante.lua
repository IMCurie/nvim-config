return {
  "yetone/avante.nvim",
  build = "make BUILD_FROM_SOURCE=true",
  event = "VeryLazy",
  version = false,
  ---@module 'avante'
  ---@type
  opts = {
    mode = "agentic",
    instructions_file = "avante.md",
    provider = "copilot",
    providers = {
      gemini = {
        model = "gemini-3-flash-preview",
      },
      copilot = {
        model = "claude-sonnet-4.5",
      },
    },
    behaviour = {
      auto_approve_tool_permissions = true,
      auto_apply_diff_after_generation = false,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "stevearc/dressing.nvim",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
