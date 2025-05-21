local function describe(x, desc)
    return vim.tbl_extend("force", x, { desc = desc })
end

vim.g.mapleader=' '
local opts = { noremap = true, silent = true }
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

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', describe(opts, ""))

