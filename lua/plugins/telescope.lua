return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "target",
                    "%.git/",
                    "dist",
                    "build",
                },
            },
        }

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope find" })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "Telescope buffer" })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set('n', '<leader>H', builtin.help_tags, { desc = "Telescope help tags" })
    end,
}

