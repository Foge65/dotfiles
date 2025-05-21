return {
    "preservim/nerdtree",
    config = function()
        vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')
        vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>')

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                local only_one_window = vim.fn.winnr("$") == 1
                local nerdtree_open = vim.fn.bufname():match("NERD_tree_") ~= nil
                local no_other_buffers = #vim.fn.getbufinfo({ buflisted = 1 }) == 1

                if only_one_window and nerdtree_open and no_other_buffers then
                    vim.cmd("quit")
                end
            end,
        })
    end
}

