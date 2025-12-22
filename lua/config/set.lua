vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.belloff = "all"

-- Ensure unicode glyphs/icons render correctly.
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Let plugins know we can render Nerd Font symbols.
vim.g.have_nerd_font = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

local frontend_ft = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "html",
  "css",
  "scss",
  "sass",
  "vue",
  "svelte",
  "json",
  "yaml",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = frontend_ft,
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = ""
