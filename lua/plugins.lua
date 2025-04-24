require("lazy").setup({
    spec = {
        { import = "plugins.gruvbox" },
        { import = "plugins.mason" },
        { import = "plugins.gitsigns" },
        { import = "plugins.telescope" },
    },
    checker = { enabled = true },
})

