return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({})
    treesitter.install({
      "bash",
      "c",
      "cpp",
      "css",
      "diff",
      "go",
      "html",
      "javascript",
      "json",
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
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
      callback = function(event)
        if vim.bo[event.buf].buftype ~= "" then
          return
        end
        if vim.treesitter.get_parser(event.buf, nil, { error = false }) then
          vim.treesitter.start(event.buf)
        end
      end,
    })
  end,
}
