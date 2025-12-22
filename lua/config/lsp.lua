vim.lsp.enable({
    "clangd",
    "pyright",
    "lua_ls",
    "rust_analyzer",
    "gopls",
    "ts_ls",
    "html",
    "cssls",
    "tailwindcss",
    "eslint",

    rust_analyzer = {
        cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    }
})

vim.diagnostic.config({
    float = {
        border = "rounded",
    },
})

if not vim.g._diagnostic_float_winhighlight then
    vim.g._diagnostic_float_winhighlight = true
    local open_float = vim.diagnostic.open_float
    vim.diagnostic.open_float = function(opts, ...)
        local float_bufnr, winid = open_float(opts, ...)
        if winid then
            vim.api.nvim_set_option_value(
                "winhighlight",
                "Normal:DiagnosticFloat,FloatBorder:DiagnosticFloatBorder",
                { win = winid }
            )
        end
        return float_bufnr, winid
    end
end

local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(event)
        local bufnr = event.buf
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    end,
})
