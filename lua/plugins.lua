require("lazy").setup({
    spec = {
        { import = "plugins.gruvbox" },
        { import = "plugins.mason" },
        { import = "plugins.gitsigns" },
    },
    checker = { enabled = true },
})

