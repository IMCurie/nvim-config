return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({
          async = false,
          timeout_ms = 1000,
          lsp_format = "fallback",
        })
      end,
      mode = { "n", "v" },
      desc = "Format (Conform)",
    },
  },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      python = { "black", "isort" },
      lua = { "stylua" },
      rust = { "rustfmt" },
      go = { "gofmt" },

      typescript = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },

      html = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
