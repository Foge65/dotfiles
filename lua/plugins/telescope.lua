return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Telescope find"} )
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {desc = "Telescope buffer"})
    end
}

