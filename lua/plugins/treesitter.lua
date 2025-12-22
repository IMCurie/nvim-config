return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "bash",
      "c",
      "cpp",
      "css",
      "diff",
      "go",
      "html",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
    }):wait(300000)
  end,
}
