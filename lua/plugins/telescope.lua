return {
  "nvim-telescope/telescope.nvim",
  version = "*",
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
      "<C-\\>",
      function()
        local builtin = require("telescope.builtin")
        local ok, err = pcall(builtin.buffers)
        if not ok then
          vim.notify(("Telescope buffers failed: %s"):format(err), vim.log.levels.ERROR)
        end
      end,
      desc = "Telescope buffers",
    },
    {
      "<C-p>",
      function()
        local builtin = require("telescope.builtin")
        local ok = pcall(builtin.git_files, { show_untracked = true })
        if not ok then
          builtin.find_files()
        end
      end,
      desc = "Telescope find files",
    },
    {
      "<C-g>",
      function()
        local builtin = require("telescope.builtin")
        local ok, err = pcall(builtin.grep_string)
        if not ok then
          vim.notify(("Telescope grep_string failed: %s"):format(err), vim.log.levels.ERROR)
        end
      end,
      desc = "Telescope grep string",
    },
    {
      "<C-l>",
      function()
        local builtin = require("telescope.builtin")
        local ok, err = pcall(builtin.live_grep)
        if not ok then
          vim.notify(("Telescope live_grep failed: %s"):format(err), vim.log.levels.ERROR)
        end
      end,
      desc = "Telescope live grep",
    },
    {
      "<leader>ss",
      function()
        local clients = vim.lsp.get_clients and vim.lsp.get_clients({ bufnr = 0 })
          or vim.lsp.get_active_clients({ bufnr = 0 })
        if not clients or vim.tbl_isempty(clients) then
          vim.notify("No LSP client attached", vim.log.levels.WARN)
          return
        end

        local builtin = require("telescope.builtin")
        local ok, err = pcall(builtin.lsp_document_symbols)
        if not ok then
          vim.notify(("Telescope lsp_document_symbols failed: %s"):format(err), vim.log.levels.ERROR)
        end
      end,
      desc = "Telescope document symbols",
    },
    {
      "<leader>sS",
      function()
        local clients = vim.lsp.get_clients and vim.lsp.get_clients({ bufnr = 0 })
          or vim.lsp.get_active_clients({ bufnr = 0 })
        if not clients or vim.tbl_isempty(clients) then
          vim.notify("No LSP client attached", vim.log.levels.WARN)
          return
        end

        local builtin = require("telescope.builtin")
        local ok, err = pcall(builtin.lsp_dynamic_workspace_symbols)
        if not ok then
          vim.notify(("Telescope lsp_dynamic_workspace_symbols failed: %s"):format(err), vim.log.levels.ERROR)
        end
      end,
      desc = "Telescope workspace symbols",
    },
  },
}
