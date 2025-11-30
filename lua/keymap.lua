local function describe(x, desc)
    return vim.tbl_extend("force", x, { desc = desc })
end

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', describe(opts, ""))
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, describe(opts, 'Open file manger'))
vim.keymap.set('i', '"', '""<left>', describe(opts, 'Replace " to ""'))
vim.keymap.set('i', "'", "''<left>", describe(opts, ""))
vim.keymap.set('i', '(', '()<left>', describe(opts, ""))
vim.keymap.set('i', '(;', '();<left><left>', describe(opts, ""))
vim.keymap.set('i', '(<CR>', '(<CR>)<ESC>O', describe(opts, ""))
vim.keymap.set('i', '(;<CR>', '(<CR>);<ESC>O', describe(opts, ""))
vim.keymap.set('i', '{', '{}<left>', describe(opts, ""))
vim.keymap.set('i', '{;', '{};<left><left>', describe(opts, ""))
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O', describe(opts, ""))
vim.keymap.set('i', '{;<CR>', '{<CR>};<ESC>O', describe(opts, ""))
vim.keymap.set('i', '[', '[]<left>', describe(opts, ""))
vim.keymap.set('i', '[;', '[];<left><left>', describe(opts, ""))
vim.keymap.set('i', '[<CR>', '[<CR>]<ESC>O', describe(opts, ""))
vim.keymap.set('i', '[;<CR>', '[<CR>];<ESC>O', describe(opts, ""))
vim.keymap.set('i', '<C-H>', '<C-w>', describe(opts, "Delete previous word"))
vim.keymap.set('n', '<M-;>', 'A;<Esc>', describe(opts, "Insert ; to end line"))

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "q", ":cclose<CR>",
            { buffer = true, noremap = true, silent = true, desc = "Close quickfix list" })
    end,
})

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "LSP format buffer" })

vim.keymap.set("v", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
    vim.cmd("normal! <Esc>")
end, { desc = "LSP format selection" })

vim.keymap.set("n", "<C-k>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>", { silent = true })
